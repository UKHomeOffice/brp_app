'use strict';

var express = require('express');
var app = express();
var path = require('path');
var debug = require('debug')('index');
var morgan = require('morgan');

var session = require('express-session');
var redis = require('redis');
var RedisStore = require('connect-redis')(session);

require('moment-business');

var config = require('./config');

if (config.env === 'development') {
  app.use('/public', express.static(path.resolve(__dirname, './public')));
}

if (config.env !== 'development' && config.env !== 'travis') {
  // use morgan in production
  app.use(morgan('combined'));
}

app.use(function setAssetPath(req, res, next) {
  res.locals.assetPath = '/public';
  next();
});

require('hmpo-govuk-template').setup(app);
app.set('view engine', 'html');
app.engine('html', require('hogan-express-strict'));
app.set('views', path.resolve(__dirname, './views'));
app.use(require('express-partial-templates')(app));

app.use(require('body-parser').urlencoded({extended: true}));
app.use(require('body-parser').json());

app.use(function setBaseUrl(req, res, next) {
  res.locals.baseUrl = req.baseUrl;
  next();
});

/*************************************/
/******* Redis session storage *******/
/*************************************/
var client = redis.createClient(config.redis.port, config.redis.host);

client.on('error', function clientErrorHandler(e) {
  throw e;
});

var redisStore = new RedisStore({
  client: client,
  ttl: config.session.ttl
});

function secureCookies(req, res, next) {
  var cookie = res.cookie.bind(res);
  res.cookie = function cookieHandler(name, value, options) {
    options = options || {};
    options.secure = (req.protocol === 'https');
    options.httpOnly = true;
    options.path = '/';
    cookie(name, value, options);
  };
  next();
}
function initSession(req, res, next) {
  session({
    store: redisStore,
    cookie: {
      secure: (req.protocol === 'https')
    },
    key: 'hmbrp.sid',
    secret: config.session.secret,
    resave: true,
    saveUninitialized: true
  })(req, res, next);
}

app.use(require('cookie-parser')(config.session.secret));
app.use(secureCookies);
app.use(initSession);

app.use(require('./routes'));

app.use(require('./errors/'));

/*eslint camelcase: 0*/
app.listen(config.port, config.listen_host);
/*eslint camelcase: 1*/

debug('App listening on port %o', config.port);
