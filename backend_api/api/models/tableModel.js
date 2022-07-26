
const mongoose = require( "mongoose" );
const validator = require( "validator" );
const bcrypt = require( "bcryptjs" );
const jwt = require( "jsonwebtoken" );
const config = require( "../utils/config" );

const Schema = mongoose.Schema;

const Status =
{
    Active: "Active",
    InAcitive: "InAcitive"

}

const tableSchema = new Schema(
    {
        name: {
            type: String,
            required: true,
            trim: true,
            index: true,
        },
        menus: {
            type: [ String ],
            required: true,
            trim: false,
        },
        total: {
            type: Number,
            default: 0.0
        },
        status: {
            type: Status,
            required: true,
        },
        approvedBy: {
            type: String,
            required: true
        },
    },
    {
        timestamps: true,
    }
);
const Table = mongoose.model( "table", tableSchema );
module.exports = Table;