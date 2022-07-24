
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

const OrderType = {
    ပါဆယ်: "ပါဆယ်",
    ဆိုင်စား: "ဆိုင်စား"
}

const MenuStatus = {
    active: 'active',
    inactive: 'inactive'
}

const menuSchema = new Schema(
    {
        name: {
            type: String,
            required: true,
            trim: true,
            index: true,
        },
        classification: {
            type: MenuClassification,
            required: true,
        },
        // orderType: {
        //     type: OrderType,
        //     required: true,
        // },
        price: {
            type: Number,
            default: 0
        },
        imageBase64: {
            type: String
        },
        imageType: {
            type: String
        },
        status: {
            type: MenuStatus
        }
    },
    {
        timestamps: true,
    }
);

const Menu = mongoose.model( "menu", menuSchema );
module.exports = Menu;