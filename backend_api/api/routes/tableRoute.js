const express = require( "express" );
const router = express.Router();
const table = require( "../controllers/tableController" );
const auth = require( "../middlewares/auth" );

router.route( "/api/v1/tables" )
    .get( table.list_all_tables )
    .post( auth, table.create_a_table );
router
    .route( "/api/v1/tables/:tableID" )
    .get( table.read_a_table )
    .post( auth, table.update_a_table )
    .delete( auth, table.delete_a_table );

module.exports = router;
