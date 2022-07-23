"use strict";
const scrypt = require( "scrypt" );
const jwt = require( "jsonwebtoken" );
const User = require( "../models/userModel" );
const config = require( "../utils/config" );

exports.list_all_users = async ( req, res ) =>
{
    try
    {
        User.find(
            { status: "active", role: config.userRoles.USER },
            ( err, user ) =>
            {
                if ( err ) res.send( err );
                res.status( 200 ).json( user );
            }
        ).sort( { name: 1 } );
    } catch ( error )
    {
        console.log( error );
        res.status( 400 ).send( error );
    }
};

exports.list_all_users_with_pagination = async ( req, res ) =>
{
    try
    {
        const options = req.query;
        console.log( `req.query = ${ JSON.stringify( req.query ) }` );
        // validate options, send 400 on error
        const sort = options.sort || {};
        const filter = options.filter || {};
        const search = options.search || {};
        const limit = parseInt( options.limit ) || 20;
        const page = parseInt( options.page ) || 0;
        const aggregation = [];
        // for default
        aggregation.push( { $sort: { name: 1 } } );
        aggregation.push( {
            $match: { status: "active", role: config.userRoles.USER },
        } );
        // for default

        Object.keys( sort ).map( ( key ) => ( sort[ key ] = parseInt( sort[ key ] ) ) );

        console.log( `sort[key] = ${ JSON.stringify( sort ) }` );

        if ( options.search )
        {
            let searchStr = search.replace( /[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&" );
            const regex = new RegExp(
                `${ searchStr }*[a-zA-Z0-9!@#$%^&)(+=._\\-\\*]*`,
                "i"
            );
            aggregation.push( {
                $match: {
                    $or: [
                        { name: { $regex: regex } },
                        { phone: { $regex: regex } },
                        { role: { $regex: regex } },
                        { email: { $regex: regex } },
                        { address: { $regex: regex } },
                        { createdBy: { $regex: regex } },
                    ],
                },
            } );
        }

        if ( options.sort ) aggregation.push( { $sort: sort } );

        const skip = page * limit;
        aggregation.push( { $skip: skip } );

        if ( limit ) aggregation.push( { $limit: limit } );

        const total = await User.countDocuments( {
            status: "active",
            role: config.userRoles.USER,
        } ).exec();

        const user = await User.aggregate( aggregation );
        return res.status( 200 ).json( {
            meta: {
                skip,
                limit,
                sort,
                filter,
                page,
                total: total,
            },
            user,
            links: {
                self: req.originalUrl,
            },
        } );
    } catch ( error )
    {
        console.log( error );
        res.status( 400 ).send( error );
    }
};

exports.list_deleted_users = async ( req, res ) =>
{
    try
    {
        User.find(
            { status: "inactive", role: config.userRoles.USER },
            ( err, user ) =>
            {
                if ( err ) res.send( err );
                res.status( 201 ).json( user );
            }
        ).sort( { name: 1 } );
    } catch ( error )
    {
        console.log( error );
        res.status( 400 ).send( error );
    }
};

exports.create_a_user = async ( req, res ) =>
{
    console.log( `Creating user... ${ req.body.phone }` );
    try
    {
        const user = new User( req.body );
        const scryptParams = scrypt.paramsSync( 0.1 );
        const kdf = scrypt.kdfSync( req.body.password, scryptParams );
        user.kdf = kdf.toString( "base64" );
        await user.save();
        const token = await user.generateAuthToken();
        res.status( 201 ).send( { user, token } );
    } catch ( error )
    {
        console.log( error );
        res.status( 400 ).send( error );
    }
};

exports.read_a_user = ( req, res ) =>
{
    console.log( `Reading user... ${ req.params.userID }` );
    User.findById( req.params.userID, ( err, user ) =>
    {
        if ( err ) res.status( 400 ).send( err );
        res.status( 200 ).json( user );
    } );
};

exports.update_a_user = ( req, res ) =>
{
    try
    {
        console.log( `Updating user... ${ req.params.userID }` );
        User.findOneAndUpdate(
            { _id: req.params.userID },
            req.body,
            { new: true },
            ( err, user ) =>
            {
                if ( err ) res.status( 500 ).send( err );
                res.status( 201 ).json( user );
            }
        );
    } catch ( error )
    {
        console.log( `[Update][user] ${ error }` );
    }
};

exports.delete_a_user = ( req, res ) =>
{
    try
    {
        console.log( `Deleting user... ${ req.params.userID }` );

        User.findOneAndUpdate(
            {
                _id: req.params.userID,
            },
            { status: "inactive" },
            { new: true },
            ( err, user ) =>
            {
                if ( err ) res.status( 500 ).send( err );
                res.status( 201 ).json( { message: "User successfully deleted" } );
            }
        );
    } catch ( error )
    {
        console.error( `[Delete][User] ${ error }` );
        res.status( 500 ).send( error );
    }
};

exports.remove_a_user = ( req, res ) =>
{
    try
    {
        console.log( `Removing user... ${ req.params.userID }` );

        User.remove(
            {
                _id: req.params.userID,
            },
            ( err, user ) =>
            {
                if ( err ) res.status( 500 ).send( err );
                res.status( 201 ).json( { message: "User successfully removed" } );
            }
        );
    } catch ( error )
    {
        console.error( `[Delete][User] ${ error }` );
        res.status( 500 ).send( error );
    }
};

exports.user_login = async ( req, res ) =>
{
    try
    {
        const { email, phone, password } = req.body;
        console.log( `Logging in user... ${ email } ${ phone }` );
        const data = email ? { email: email } : { phone: phone };
        console.log( data );
        const userRes = await User.findByCredentials( data, password );
        if ( !userRes[ "user" ] )
        {
            return res.json( userRes );
        }
        const userInfo = userRes[ "user" ];
        if ( userInfo.tokens.length >= 1 )
        {
            res.status( 200 ).json( {
                message:
                    "အကောင့် ဝင်၍မရပါ။ 09787000067 ကို ရုံးချိန် နံနက် ၉ နာရီမှ ညနေ ၆ နာရီအတွင်း ဆက်သွယ်မေးမြန်းပေးပါ။",
            } );
            return;
        }
        const token = await userInfo.generateAuthToken();
        const user = {
            id: userInfo._id,
            name: userInfo.name,
            email: userInfo.email,
            phone: userInfo.phone,
            address: userInfo.address,
        };
        console.log( `[User][Login] User login SUCCESS!` );
        res.status( 201 ).json( {
            user,
            token,
        } );
    } catch ( error )
    {
        res.status( 400 ).json( error );
    }
};

exports.user_profile = async ( req, res ) =>
{
    try
    {
        res.status( 201 ).send( req.user );
    } catch ( error )
    {
        res.status( 500 ).send( error );
    }
};

exports.user_logout = async ( req, res ) =>
{
    try
    {
        req.user.tokens = req.user.tokens.filter( ( token ) =>
        {
            return token.token != req.token;
        } );
        await req.user.save();
        res.status( 201 ).json( { message: "သင်၏ အကောင့်သည် ဤစက်မှ ထွက်လိုက်ပါပြီ။" } );
    } catch ( error )
    {
        res.status( 500 ).send( error );
    }
};

exports.user_logout_all = async ( req, res ) =>
{
    try
    {
        req.user.tokens.splice( 0, req.user.tokens.length );
        await req.user.save();
        res.status( 201 ).json( { message: "သင်၏ အကောင့်သည် ဤစက်မှ ထွက်လိုက်ပါပြီ။" } );
    } catch ( error )
    {
        res.status( 500 ).send( error );
    }
};

exports.user_salt = ( req, res ) =>
{
    try
    {
        const { email, phone } = req.body;
        console.log( `Getting Salt in user... ${ email } ${ phone }` );
        const data = email ? { email: email } : { phone: phone };
        User.findOne( data, ( err, user ) =>
        {
            if ( err ) res.status( 500 ).send( err );
            else if ( !user ) res.status( 400 ).json( { message: "User Not Found" } );
            else if ( user ) res.status( 201 ).json( { salt: user.salt } );
        } );
        // const user = await User.findOne({ email });
    } catch ( error )
    {
        console.log( `[Get][Salt] ${ error }` );
        res.status( 500 ).send( error );
    }
};

exports.user_change_password = async ( req, res ) =>
{
    try
    {
        await User.findOne( { _id: req.params.userID }, ( err, user ) =>
        {
            if ( err ) console.log( err );
            if ( req.body.password.length < 7 )
            {
                res.status( 500 ).json( {
                    error:
                        "စကားဝှက်သည် သတ်မှတ်ထားသော အရေအတွက် ၇ လုံးထက် လျော့နေပါသဖြင့် ပြင်ဆင်ပေးပါ။",
                } );
                return;
            }
            const scryptParams = scrypt.paramsSync( 0.1 );
            const kdf = scrypt.kdfSync( req.body.password, scryptParams );
            user.password = req.body.password;
            user.kdf = kdf.toString( "base64" );
            user.save( ( err ) =>
            {
                if ( err ) res.status( 500 ).send( err );
                res.status( 200 ).json( {
                    message: "သင်၏ စကားဝှက်ကို အောင်မြင်စွာ ပြောင်းလဲပြီးပါပြီ။",
                } );
            } );
        } );
    } catch ( error )
    {
        console.log( `[Change][Password] ${ error }` );
        res.status( 500 ).send( error );
    }
};

exports.check_user_token = async ( req, res ) =>
{
    const token = req.header( "Authorization" ).replace( "Bearer ", "" ).trim();
    try
    {
        const data = jwt.verify( token, process.env.JWT_KEY );
        const user = await User.findOne( { _id: data._id } );
        if ( !user )
        {
            throw new Error();
        }
        res.status( 200 ).json( {
            status: true,
            message: "Authorized to access this resource!",
        } );
    } catch ( error )
    {
        console.log( error.message );
        const user = await User.findOne( {
            _id: req.body.userID,
        } );
        if ( user.tokens )
        {
            req.user = user;
            req.user.tokens.splice( 0, req.user.tokens.length );
            await req.user.save();
        }
        res.status( 401 ).send( {
            status: false,
            message: `Not authorized to access this resource! ${ error.message } Please login again.`,
        } );
    }
};
