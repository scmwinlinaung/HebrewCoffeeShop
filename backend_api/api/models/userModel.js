
const mongoose = require( "mongoose" );
const validator = require( "validator" );
const scrypt = require( "scrypt" );
const bcrypt = require( "bcryptjs" );
const jwt = require( "jsonwebtoken" );
const config = require( "../utils/config" );

const Schema = mongoose.Schema;

const userSchema = new Schema(
    {
        name: {
            type: String,
            required: true,
            trim: true,
            index: true,
        },
        phone: {
            type: String,
            required: true,
            unique: true,
        },
        email: {
            type: String,
            lowercase: true,
            validate: ( value ) =>
            {
                if ( !validator.isEmail( value ) )
                {
                    throw new Error( { error: "Invalid Email address" } );
                }
            },
        },
        role: {
            type: String,
            default: config.userRoles.USER,
        },
        password: {
            type: String,
            required: true,
            minlength: 6,
        },
        kdf: {
            type: String,
            required: true,
            minlength: 7,
        },
        salt: {
            type: String,
            required: true,
            minlength: 7,
        },
        address: {
            type: String,
        },
        status: {
            type: String,
            default: "active",
        },
        tokens: [
            {
                token: {
                    type: String,
                    require: true,
                },
            },
        ],
    },
    {
        timestamps: true,
    }
);

userSchema.pre( "save", async function ( next )
{
    // Hash the password before saving the user model
    const user = this;
    if ( user.isModified( "password" ) )
    {
        user.password = await bcrypt.hash( user.password, 12 );
    }
    next();
} );

userSchema.methods.generateAuthToken = async function ()
{
    // Generate an auth token for the user
    const user = this;
    const token = jwt.sign( { _id: user._id }, process.env.JWT_KEY ? process.env.JWT_KEY : "asfdpo3q4@#@#" );
    user.tokens = user.tokens.concat( { token } );
    await user.save();
    return token;
};

userSchema.statics.findByCredentials = async ( data, password ) =>
{
    // Search for a user by email and password.
    //console.log(data);
    const user = await User.findOne( data );
    if ( !user )
    {
        return {
            status: "error",
            message: "အကောင့်မရှိပါ။",
            user: null,
        };
    }
    // const isPasswordMatch = await bcrypt.compare(password, user.password);
    const isPasswordMatch = scrypt.verifyKdfSync(
        Buffer.from( user.kdf, "base64" ),
        password
    );
    console.log( isPasswordMatch );
    if ( !isPasswordMatch )
    {
        return {
            status: "error",
            message: "စကားဝှက်မမှန်ပါ။",
            user: null,
        };
    }
    return { status: "success", message: "valid login", user: user };
};

const User = mongoose.model( "user", userSchema );

module.exports = User;
