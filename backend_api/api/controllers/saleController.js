
const jwt = require( "jsonwebtoken" );
const Sale = require( "../models/saleModel" );
const config = require( "../utils/config" );

exports.list_all_sales = async ( req, res ) =>
{
    try
    {
        const sales = await Sale.find().sort( { createdAt: -1 } );
        res.status( 200 ).json( sales );
    } catch ( error )
    {
        console.log( error );
        res.status( 400 ).send( error );
    }
}

exports.create_a_sale = async ( req, res ) =>
{
    console.log( `Creating sale... ${ req.body.name }` );
    try
    {
        const sale = new Sale( req.body );

        await sale.save();
        //const token = await sale.generateAuthToken();
        res.status( 201 ).send( sale );
    } catch ( error )
    {
        console.log( error );
        res.status( 400 ).send( error );
    }
}

exports.read_a_sale = async ( req, res ) =>
{
    console.log( `Reading sale... ${ req.params.saleID }` );
    Sale.findById( req.params.saleID, ( err, sale ) =>
    {
        if ( err ) res.status( 400 ).send( err );
        res.status( 200 ).json( sale );
    } );
}

exports.update_a_sale = ( req, res ) =>
{
    try
    {
        console.log( `Updating sale... ${ req.params.saleID }` );
        Sale.findOneAndUpdate(
            { _id: req.params.saleID },
            req.body,
            { new: true },
            ( err, sale ) =>
            {
                if ( err ) res.status( 500 ).send( err );
                res.status( 201 ).json( sale );
            }
        );
    } catch ( error )
    {
        console.log( `[Update][sale] ${ error }` );
    }
};

exports.delete_a_sale = ( req, res ) =>
{
    try
    {
        console.log( `Removing sale... ${ req.params.saleID }` );

        Sale.remove(
            {
                _id: req.params.saleID,
            },
            ( err, sale ) =>
            {
                if ( err ) res.status( 500 ).send( err );
                res.status( 201 ).json( { message: "Sale successfully removed" } );
            }
        );
    } catch ( error )
    {
        console.error( `[Delete][Sale] ${ error }` );
        res.status( 500 ).send( error );
    }
};
