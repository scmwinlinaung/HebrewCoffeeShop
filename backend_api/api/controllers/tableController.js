
const jwt = require( "jsonwebtoken" );
const Table = require( "../models/tableModel" );
const config = require( "../utils/config" );

exports.list_all_tables = async ( req, res ) =>
{
    try
    {
        const tables = await Table.find().sort( { createdAt: -1 } );
        res.status( 200 ).json( tables );
    } catch ( error )
    {
        console.log( error );
        res.status( 400 ).send( error );
    }
}

exports.create_a_table = async ( req, res ) =>
{
    console.log( `Creating table... ${ req.body.name }` );
    try
    {
        const table = new Table( req.body );

        await table.save();
        //const token = await table.generateAuthToken();
        res.status( 201 ).send( table );
    } catch ( error )
    {
        console.log( error );
        res.status( 400 ).send( error );
    }
}

exports.read_a_table = async ( req, res ) =>
{
    console.log( `Reading table... ${ req.params.tableID }` );
    Table.findById( req.params.tableID, ( err, table ) =>
    {
        if ( err ) res.status( 400 ).send( err );
        res.status( 200 ).json( table );
    } );
}

exports.update_a_table = ( req, res ) =>
{
    try
    {
        console.log( `Updating table... ${ req.params.tableID }` );
        console.log( req.body );
        Table.findOneAndUpdate(
            { _id: req.params.tableID },
            req.body,
            { new: true },
            ( err, table ) =>
            {
                if ( err ) res.status( 500 ).send( err );
                res.status( 200 ).json( table );
            }
        );
    } catch ( error )
    {
        console.log( `[Update][table] ${ error }` );
    }
};

exports.delete_a_table = ( req, res ) =>
{
    try
    {
        console.log( `Removing table... ${ req.params.tableID }` );

        Table.remove(
            {
                _id: req.params.tableID,
            },
            ( err, table ) =>
            {
                if ( err ) res.status( 500 ).send( err );
                res.status( 201 ).json( { message: "Table successfully removed" } );
            }
        );
    } catch ( error )
    {
        console.error( `[Delete][Table] ${ error }` );
        res.status( 500 ).send( error );
    }
};
