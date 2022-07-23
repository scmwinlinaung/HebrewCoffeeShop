const express = require( "express" );
const router = express.Router();
const user = require( "../controllers/userController" );
const auth = require( "../middlewares/auth" );

router.route( "/api/v1/users" )
    .get( user.list_all_users )
    .post( user.create_a_user );
router
    .route( "/api/v1/users/:userID" )
    .get( user.read_a_user )
    .post( auth, user.update_a_user )
    .delete( auth, user.delete_a_user );

router.route( "/api/v1/users/me/login" ).post( user.user_login );

router.route( "/api/v1/users/me/get_salt" ).get( user.user_salt );

router.route( "/api/v1/users/me/profile" ).get( auth, user.user_profile );

router.route( "/api/v1/users/me/logout" ).post( auth, user.user_logout );

router.route( "/api/v1/users/me/logoutall" ).post( auth, user.user_logout_all );

router.route( "/api/v1/users/me/token" ).post( user.check_user_token );

router
    .route( "/api/v1/users/me/changepassword/:userID" )
    .post( user.user_change_password );


module.exports = router;
