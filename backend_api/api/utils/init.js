const bcrypt = require( "bcryptjs" );
const User = require( "../models/userModel" );
const config = require( "./config" );
const tableModel = require( "../models/tableModel" );

onCreate = async () =>
{
    try
    {
        // add default 10 tables
        if ( await tableModel.countDocuments() < 1 )
        {
            for ( var i = 0; i < 10; i++ )
            {
                const table = {
                    name: `Table ${ i + 1 }`,
                    menus: [],
                    amount: 0,
                    status: "InAcitive",
                    approvedBy: 'Admin'
                }
                await tableModel.create( table );
            }


        }
    } catch ( error )
    {
        console.log( "Default data has been added!!" );
    }
};

onCreate();
