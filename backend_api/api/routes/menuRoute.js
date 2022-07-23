const express = require( "express" );
const router = express.Router();
const menu = require( "../controllers/menuController" );
const auth = require( "../middlewares/auth" );

router.route( "/api/v1/menus" )
    .get( menu.list_all_menus )
    .post( auth, menu.create_a_menu );
router
    .route( "/api/v1/menus/:menuID" )
    .get( menu.read_a_menu )
    .post( auth, menu.update_a_menu )
    .delete( auth, menu.delete_a_menu );

module.exports = router;
