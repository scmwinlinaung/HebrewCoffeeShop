
const jwt = require( "jsonwebtoken" );
const Menu = require( "../models/menuModel" );
const config = require( "../utils/config" );

exports.list_all_menus = async ( req, res ) =>
{
    try
    {
        const menus = await Menu.find().sort( { name: 1 } );
        res.status( 200 ).json( menus );
    } catch ( error )
    {
        console.log( error );
        res.status( 400 ).send( error );
    }
}

exports.create_a_menu = async ( req, res ) =>
{
    console.log( `Creating menu... ${ req.body.name }` );
    try
    {
        const menu = new Menu( req.body );

        await menu.save();
        //const token = await menu.generateAuthToken();
        res.status( 201 ).send( menu );
    } catch ( error )
    {
        console.log( error );
        res.status( 400 ).send( error );
    }
}

exports.read_a_menu = async ( req, res ) =>
{
    console.log( `Reading menu... ${ req.params.menuID }` );
    Menu.findById( req.params.menuID, ( err, menu ) =>
    {
        if ( err ) res.status( 400 ).send( err );
        res.status( 201 ).json( menu );
    } );
}

exports.update_a_menu = ( req, res ) =>
{
    try
    {
        console.log( `Updating menu... ${ req.params.menuID }` );
        Menu.findOneAndUpdate(
            { _id: req.params.menuID },
            req.body,
            { new: true },
            ( err, menu ) =>
            {
                if ( err ) res.status( 500 ).send( err );
                res.status( 201 ).json( menu );
            }
        );
    } catch ( error )
    {
        console.log( `[Update][menu] ${ error }` );
    }
};

exports.delete_a_menu = ( req, res ) =>
{
    try
    {
        console.log( `Removing menu... ${ req.params.menuID }` );

        Menu.remove(
            {
                _id: req.params.menuID,
            },
            ( err, menu ) =>
            {
                if ( err ) res.status( 500 ).send( err );
                res.status( 201 ).json( { message: "Menu successfully removed" } );
            }
        );
    } catch ( error )
    {
        console.error( `[Delete][Menu] ${ error }` );
        res.status( 500 ).send( error );
    }
};
