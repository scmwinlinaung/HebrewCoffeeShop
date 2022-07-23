"use strict";
const jwt = require( "jsonwebtoken" );
const User = require( "../models/userModel" );

const auth = async ( req, res, next ) =>
{
    try
    {
        const token = req.header( "Authorization" ).replace( "Bearer ", "" ).trim();
        const data = jwt.verify( token, process.env.JWT_KEY ? process.env.JWT_KEY : "asfdpo3q4@#@#" );
        const user = await User.findOne( { _id: data._id } );
        if ( !user )
        {
            throw new Error();
        }
        req.user = user;
        req.token = token;
        next();
    } catch ( error )
    {
        res
            .status( 401 )
            .send( { message: null, error: "Not authorized to access this resource" } );
    }
};
module.exports = auth;
