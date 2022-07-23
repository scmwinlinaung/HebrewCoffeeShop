
const mongoose = require( "mongoose" );
const validator = require( "validator" );
const bcrypt = require( "bcryptjs" );
const jwt = require( "jsonwebtoken" );
const config = require( "../utils/config" );

const Schema = mongoose.Schema;

const MenuClassification =
{
    အရည်: "အရည်",
    မုန့်: "မုန့်",
    ထမင်းနှင့်ဟင်း: "ထမင်းနှင့်ဟင်း"

}
const saleSchema = new Schema(
    {
        name: {
            type: String,
            required: true,
            trim: true,
            index: true,
        },
        menuClassification: {
            type: MenuClassification,
            required: true
        },
        price: {
            type: Number,
            default: 0
        },
        menu: {
            type: String,
            required: true,
            trim: false,
        },
        amount: {
            type: Number,
            default: 0
        },
    },
    {
        timestamps: true,
    }
);
const Sale = mongoose.model( "sale", saleSchema );
module.exports = Sale;