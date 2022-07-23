const mongoose = require( "mongoose" );
mongoose.Promise = global.Promise;

const url = process.env.MONGODB_URL || "mongodb://mongo1:27017,mongo2:27018,mongo3:27019/restaurant_management_system?replicaSet=devrs";
connectDB = async () =>
{
	try
	{
		mongoose
			.connect( url, {
				useNewUrlParser: true,
				useFindAndModify: false,
				useUnifiedTopology: true,
			} );
		console.log( `Connected to mongo at ${ url }` );
	} catch ( e )
	{
		console.log( "failed connected to database ", err );
	}
}

connectDB();