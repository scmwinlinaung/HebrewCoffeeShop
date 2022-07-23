const express = require( "express" );
const bodyParser = require( "body-parser" );

const menuRouter = require( "./api/routes/menuRoute" );
const saleRouter = require( "./api/routes/saleRoute" );
const tableRouter = require( "./api/routes/tableRoute" );
const userRouter = require( "./api/routes/userRoute" );

require( "./api/utils/dbconnect" );
require( "./api/utils/init" );

var app = express(),
    port = process.env.PORT || 8081;
app.use( bodyParser.urlencoded( { extended: true } ) );
app.use( bodyParser.json() );
app.use( menuRouter );
app.use( saleRouter );
app.use( tableRouter );
app.use( userRouter );


app.listen( port, ( err ) =>
{
    if ( err ) throw err;
    console.log( `RMS Server started on ${ port } ...` );
} );
