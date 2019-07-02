const express = require('express');
const logger = require('morgan');
const bodyParser = require('body-parser');
const passport = require('passport');
const pe = require('parse-error');
const cors = require('cors');

const v1 = require('./routes/v1');
const app = express();
const expressSwagger = require('express-swagger-generator')(app);

const CONFIG = require('./config/config');

let options = {
	swaggerDefinition: {
		info: {
			description: 'This is a sample server',
			title: 'Template API With Auth and User Model',
			version: '1.0.0'
		},
		host: 'localhost:3000',
		basePath: '/',
		produces: [ 'application/json' ],
		schemes: [ 'http' ],
		securityDefinitions: {
			JWT: {
				type: 'apiKey',
				in: 'header',
				name: 'Authorization',
				description: ''
			}
		}
	},
	basedir: __dirname, //app absolute path
	files: [ './routes/**/*.js', './models/*.js' ] //Path to the API handle folder
};

expressSwagger(options);

app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.use(passport.initialize());

console.log('Environment:', CONFIG.app);

const models = require('./models');
models.sequelize
	.authenticate()
	.then(() => {
		console.log('Connected to SQL database:', CONFIG.db_name);
	})
	.catch((err) => {
		console.error('Unable to connect to SQL database:', CONFIG.db_name, err);
	});

//models.sequelize.sync({ force: true });

app.use(cors());

app.use('/', v1);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
	var err = new Error('Not Found');
	err.status = 404;
	next(err);
});

// error handler
app.use(function(err, req, res, next) {
	// set locals, only providing error in development
	res.locals.message = err.message;
	res.locals.error = req.app.get('env') === 'development' ? err : {};

	// render the error page
	res.status(err.status || 500);
	res.render('error');
});

module.exports = app;

process.on('unhandledRejection', (error) => {
	console.error('Uncaught Error', pe(error));
});
