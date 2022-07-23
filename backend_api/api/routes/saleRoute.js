const express = require( "express" );
const router = express.Router();
const sale = require( "../controllers/saleController" );
const auth = require( "../middlewares/auth" );

router.route( "/api/v1/sales" )
    .get( sale.list_all_sales )
    .post( auth, sale.create_a_sale );
router
    .route( "/api/v1/sales/:saleID" )
    .get( sale.read_a_sale )
    .post( auth, sale.update_a_sale )
    .delete( auth, sale.delete_a_sale );

module.exports = router;
