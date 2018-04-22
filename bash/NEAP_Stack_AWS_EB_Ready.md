### Neap Stack Scaffold Shell Script;

- **N** ode version 8.0 or greater
- **E** xpress Version 4.16.2
- **A** ngularJS 1.6.9
- **P** ostGreSQL 6.4.0


---

##### TO-DO LIST:  
- CREATE MIGRATIONS BY DATA TYPE
- CREATE SEED DATA WITH DESIRED DATA
- CREATE MULTIPLE TEMPLATES
- Look into sed shell command to insert on a specific line
- [Write to file line](http://stackoverflow.com/questions/15157659/add-text-to-file-at-certain-line-in-linux)
_IDK_
- You can use sed to solve this:
$`sed "15i avatar" Makefile.txt`
_or_ use the `-i` option to save the changes made to the file.
$`sed -i "15i avatar" Makefile.txt`
To change all the files beginning that start Makefile:
$`sed "15i avatar" Makefile*`
Note: In the above 15 is your line of interest to place the text.




---

#### Broken Stuff:
  - [ ] All the AngularJS Variables that start with **$** are removed and left as white space;
  - [ ] Potential solutions:
    - [ ] use echo and single quotes to use literal declaration.
    - [ ] Write better code
    - [ ] Remove Memes, Un-embed Stupid all instances of yolo





```sh
ngtemp(){
echo "
AngularJS Express PostGreSQL
🦑🦑    NAME THAT APP:   🦑 🦑 "
# creating clients application name as appName ==========================
read appName

# Regex to check for alphanumeric characters in appName ==================
appName=${appName//[^a-zA-Z0-9_]/}

if [[ -z $appName ]] ; then
   echo "Please enter app name with alphanumeric characters only"
   echo "Remember there must be a length for the file names!"
   return 0
fi

take $appName

cat > server.js <<RNEND
const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const app = express();

app.use(bodyParser.json());

// The endpoints hit by angular front end
app.use('/api/home', require('./routes/home'))

// GETS RID OF NEED FOR NODE_MODULES PATH
app.use(express.static('public'));
app.use(express.static('node_modules'));

// SERVING 'index.html'
app.use('*', function(req, res) {
  res.sendFile('index.html', { root: path.join(__dirname, 'public') });
});

app.use(function(req, res, next) {
  const err = new Error('Not Found');
  err.status = 404;
  next(err);

});

module.exports = app;
RNEND

cat > package.json <<JSONEND
{
  "name": "$appName",
  "author": "Satoshi Nakamoto",
  "version": "4.2.0",
  "scripts": {
    "start": "node ./bin/www",
    "dev": "run-script-os",
    "build": "run-script-os",
    "export": "run-script-os",
    "firststart": "npm i && npm run dbsetup && npm run dev",
    "dbsetup": "bash ./initialStartUp.sh",
    "dev:darwin:linux": "rm -rf public && concurrently  --kill-others \"nodemon -d 1 ./bin/www -w sever -w ./routes -w bin/www\" \"gulp start\"",
    "build:darwin:linux": "rm -rf public && gulp build",
    "export:darwin:linux": "bash ./export.sh"
  },
  "engines": {
    "node": ">=0.8.0"
  },
  "dependencies": {
    "angular": "^1.6.9",
    "angular-moment": "^1.2.0",
    "angular-resource": "^1.6.5",
    "angular-ui-router": "^1.0.3",
    "aws-sdk": "^2.205.0",
    "express": "^4.16.2",
    "gulp-refresh": "^1.1.0",
    "jquery": "^3.3.1",
    "knex": "^0.13.0",
    "moment": "^2.21.0",
    "morgan": "^1.8.2",
    "nodemon": "^1.14.12",
    "pg": "^6.4.0",
    "source-map": "^0.7.0",
    "three": "^0.90.0",
    "ui-router": "^1.0.0-alpha.3",
    "vinyl-buffer": "^1.0.1",
    "vinyl-source-stream": "^2.0.0"
  },
  "devDependencies": {
    "babel-core": "^6.26.0",
    "babel-plugin-angularjs-annotate": "^0.8.2",
    "babel-preset-env": "^1.6.1",
    "browserify": "^15.2.0",
    "concurrently": "^3.5.1",
    "eslint": "^4.15.0",
    "eslint-plugin-angular": "^3.1.1",
    "gulp": "^3.9.1",
    "gulp-babel": "^7.0.0",
    "gulp-concat-css": "^3.0.0",
    "gulp-eslint": "^4.0.1",
    "gulp-imagemin": "^4.1.0",
    "gulp-notify": "^3.2.0",
    "gulp-uglify": "^3.0.0",
    "gulp-uglifycss": "^1.0.9",
    "nodemon": "^1.14.12",
    "run-script-os": "^1.0.3",
    "vinyl-buffer": "^1.0.1",
    "vinyl-source-stream": "^2.0.0"
  }
}
JSONEND

# BASIC KNEX.JS CREATION
cat > knex.js <<knexEND
module.exports =
  require('knex')
  (require('./knexfile')[process.env.NODE_ENV || 'development'])

knexEND



# Naming the DATABASE ==============================
echo "
🌋🌋🌋🌋🌋 QUICK GIMME A DB NAME! 🌋🌋🌋"
# Storing DATABASE NAME AS VARIABLE dataFortress ==================
read dataFortress
dataFortress=${dataFortress//[^a-zA-Z0-9_]/}
# Logic to detect if DATABASE Name is null =======================
if [[ -z $dataFortress ]] ; then
   echo "Please enter database name with alphanumeric characters only"
   echo "Remember there must be a length for the database name!"
   return 0
fi

# ====================== CREATES A NAMED KNEXFILE LINKED TO CHOSEN DB NAME

cat > knexfile.js <<knexfileEND
module.exports = {
  development: {
    client: 'pg',
    connection: { database: '$dataFortress' }
  },
  production: { client: 'pg', connection: process.env.DATABASE_URL }
};
knexfileEND





# ==================== CREATES GULPFILE

cat > gulpfile.js <<gulpfileEND
const browserify = require('browserify');
const gulp = require('gulp');
const babel = require('gulp-babel');
const concatCss = require('gulp-concat-css');
const eslint = require('gulp-eslint');
const image = require('gulp-imagemin');
const notify = require('gulp-notify');
const uglify = require('gulp-uglify');
const uglifyCss = require('gulp-uglifycss');
const gutil = require('gulp-util');
const buffer = require('vinyl-buffer');
const source = require('vinyl-source-stream');



gulp.task('lint', () => {
  // lint any js files we create
  return gulp.src([
      'src/app/**/**/*.js'
    ]).pipe(eslint())
    .on('error', onError)
    .pipe(eslint.format())
    .on('error', onError)
});

gulp.task('scripts', () => {
  // browserify bundles all javascript into on file based on the contents of app.js
  return browserify('src/app/app.js')
    .on('error', onError)
    .bundle()
    .on('error', onError)
    .pipe(source('main.js'))
    .on('error', onError)
    // create a buffer of code that can be used by babel to remove es6 syntax and to minify
    .pipe(buffer())
    .on('error', onError)
    .pipe(babel())
    .on('error', onError)
    .pipe(uglify())
    .on('error', onError)
    .pipe(gulp.dest('public'))
    .on('error', onError)
});

gulp.task('css', () => {
  return gulp.src('src/app/css/*.css')
    .on('error', onError)
    .pipe(concatCss('main.css'))
    .on('error', onError)
    .pipe(uglifyCss())
    .on('error', onError)
    .pipe(gulp.dest('public'))
    .on('error', onError)
});

gulp.task('images', () => {
  // prevents the images from being corrupted, and also minifys
  gulp.src('src/favicon.ico')
    .pipe(image())
    .on('error', onError)
    .pipe(gulp.dest('public'))
    .on('error', onError);

  return gulp.src('src/images/*.*')
    .pipe(image())
    .on('error', onError)
    .pipe(gulp.dest('public/images'))
    .on('error', onError)
});

gulp.task('browserify', () => browserifyFunc());
gulp.task('copy', () => copy());

gulp.task('build', ['lint', 'copy', 'scripts', 'images', 'css'], () => {

  // function to notify the user when all of the build tasks are complete
  gulp.src('src/index.html')
    .pipe(notify({
      message: "Build Complete",
      title: 'Gulp Build',
      onLast: true,
      wait: true
    }))
});

gulp.task('start', ['default', 'lint'], () => {
  gulp.src('src/index.html')
    .pipe(notify({
      message: "Build Complete",
      title: 'Gulp Build',
      onLast: true,
      wait: true
    }))
});

gulp.task('default', ['copy', 'browserify', 'images', 'css'], () => {
  // watch our source files for a change and reloads files
  gulp.watch(['src/app/*.*', 'src/app/**/*.*', 'src/app/**/**/*.*', '!src/app/css/*.*', 'src/index.html'], {
    interval: 500,
    debounceDelay: 200
  }, (file) => {
    if (!file.path.includes('.min.js')) {
      // notify the user when the task is complete
      notifyOnChange().then(() => gulp.src('src/index.html').pipe(notify({
        message: "Build Complete",
        title: 'Gulp Build',
        onLast: true,
        wait: true
      })));
    }

  });


  // combine and minify css
  gulp.watch('src/app/css/*.css', {
    debounceDelay: 200,
    interval: 500
  }, ['css']);

  // only lint the file that was changed instead of the whole project
  gulp.watch('src/app/**/*.js', {
    debounceDelay: 200,
    interval: 500
  }, (ev) => {
    if ((ev.type === 'added' || ev.type === 'changed') && ev.path.includes('.js')) {
      lintFile(ev.path);
    }
  });

  // ADDING FN FOR INDIVIDUAL COMPONENT JS FILE LINTING
  gulp.watch('src/app/**/**/*.js', {
    debounceDelay: 200,
    interval: 500
  }, (ev) => {
    if ((ev.type === 'added' || ev.type === 'changed') && ev.path.includes('.js')) {
      lintFile(ev.path);
    }
  });

});

function onError(err) {
  // display error in terminal and notify the user there was an error
  gutil.log(gutil.colors.red('[Error]'), gutil.colors.red(err.toString()));

  gulp.src('src/index.html').pipe(notify({
    message: err.toString(),
    title: 'Error',
    wait: true
  }));

  // prevent gulp from terminating on an error
  this.emit('end');
}

function lintFile(file) {
  gulp.src(file)
    .pipe(eslint())
    .on('error', onError)
    .pipe(eslint.format())
    .on('error', onError);
}


async function copy() {
  return gulp.src([
      '!src/app/**/*.js',
      '!images/*.{png,jpg,svg}',
      '!images/',
      'src/**/*.*'
    ]).pipe(gulp.dest('public'))
    .on('error', onError);
}

async function browserifyFunc() {

  return browserify('src/app/app.js')
    .bundle()
    .on('error', onError)
    .pipe(source('main.js'))
    .on('error', onError)
    .pipe(gulp.dest('public'))
    .on('error', onError);
}

async function notifyOnChange() {
  const done = await copy().then(() => gutil.log(`Finished '${gutil.colors.cyan('copy')}'`)) && await browserifyFunc().then(() => gutil.log(`Finished '${gutil.colors.cyan('browserify')}'`));
  return await done;
}
gulpfileEND


# ==================== CREATES EXPORT.SH FILE
cat > export.sh <<exportEND

rm -rf public

rm .bowerrc

echo '{
    "directory": "public/bower_components"
}' >> .bowerrc

gulp build

rm export.zip

zip export.zip -r . -x '/.git/*' '/src/*' '/node_modules/*' 'gulpfile.js' '.stylelintrc' '.DS_Store' '.eslintrc' '.babelrc' 'yarn.lock' '*.sh' '.gitignore' 'README.md' '.eslintignore'

rm .bowerrc

echo '{
    "directory": "src/bower_components"
}' >> .bowerrc

exportEND


# ===================   CREATES .stylelintrc FILE
cat > .stylelintrc <<stylelintrcEND

{
  "rules": {
    "block-no-empty": null,
    "color-no-invalid-hex": true,
    "declaration-colon-space-after": "always",
    "max-empty-lines": 2,
    "rule-empty-line-before": [ "always", {
      "except": ["first-nested"],
      "ignore": ["after-comment"]
    } ],
    "unit-whitelist": ["em", "rem", "%", "s", "px", "vh", "vw", "deg"]
  }
}

stylelintrcEND



# ===================   CREATES .gitignore FILE
cat > .gitignore <<gitignoreEND

.DS_Store
node_modules
.hiddenfiles

gitignoreEND





# ===================   CREATES .eslintrc FILE
cat > .eslintrc <<eslintrcEND

{
  "parserOptions": {
    "ecmaVersion": 8,
    "sourceType": "module",
    "ecmaFeatures": {
      "modules": true,
      "experimentalObjectRestSpread": true
    }
  },
  "env": {
      "browser": true,
      "node": true,
      "jquery": true,
      "es6": true
  },
  "globals": {
    "AFRAME": true,
    "angular": true,
    "AWS": true,
    "describe": true,
    "it": true,
    "vis": true
  },
  "plugins": [
    "angular"
  ],
  "extends": [
    "eslint:recommended"
  ],
  "rules": {
    "no-console": ["error", { allow: ["warn", "error"] }],
    "no-mixed-spaces-and-tabs": 0,
    "import/no-extraneous-dependecies": 0,
    "semi": 1,
    "array-callback-return": 0,
    "indent": ["error", 2],
    "no-var": 2,
    "prefer-const": 2
  }
}


eslintrcEND




# ===================   CREATES .eslintignore FILE
cat > .eslintignore <<eslintignoreEND
public/*

eslintignoreEND

take routes

# ===================   CREATES Home Route FILE
cat > home.js <<homerouteEND
const express = require('express')
const router = express.Router()
const knex = require('../knex')

router.route('/')
  .get((req, res) => {
    console.error('home')
    knex('home1').select()
      .then((all) => {
        res.send(all);
      });
  })

  .post((req, res) => {
    console.log('req.body ==== ', req.body)
    knex('home1').returning(['id', 'title', 'description', 'price', 'item_image'])
      .insert(req.body).then((item) => {
        res.send(item[0]);
        // console.log(item[0])
      });
  });

router.route('/:id')

  .patch((req, res) => {
    // console.log(req.params.id);
    knex('home1').where('id', req.params.id).returning(['id', 'title', 'description', 'price', 'item_image'])
      .update(req.body).then((item) => {
        res.send(item[0]);
      });
  })

  .delete((req, res) => {
    knex('home1').where('id', req.params.id).returning(['id', 'title', 'description', 'price', 'item_image'])
      .del().then((item) => {
        res.send(item[0]);
      });
  });

module.exports = router

homerouteEND

cd ..

take bin

# ===================   CREATES www FILE
cat > www <<wwwEND
#!/usr/bin/env node

/**
 * Module dependencies.
 */

const app = require('../server');
const debug = require('debug')('app:server');
const http = require('http');

/**
 * Get port from environment and store in Express.
 */

const port = normalizePort(process.env.PORT || 8080);
app.set('port', port);

/**
 * Create HTTP server.
 */

const server = http.createServer(app);

/**
 * Listen on provided port, on all network interfaces.
 */

server.listen(port);
server.on('error', onError);
server.on('listening', onListening);

/**
 * Normalize a port into a number, string, or false.
 */

function normalizePort(val) {
  const port = parseInt(val, 10);

  if (isNaN(port)) {
    // named pipe
    return val;
  }

  if (port >= 0) {
    // port number
    return port;
  }

  return false;
}

/**
 * Event listener for HTTP server "error" event.
 */

function onError(error) {
  if (error.syscall !== 'listen') {
    throw error;
  }

  const bind = typeof port === 'string'
    ? 'Pipe ' + port
    : 'Port ' + port;

  // handle specific listen errors with friendly messages
  switch (error.code) {
    case 'EACCES':
      console.error(bind + ' requires elevated privileges');
      process.exit(1);
      break;
    case 'EADDRINUSE':
      console.error(bind + ' is already in use');
      process.exit(1);
      break;
    default:
      throw error;
  }
}

/**
 * Event listener for HTTP server "listening" event.
 */

function onListening() {
  const addr = server.address();
  const bind = typeof addr === 'string'
    ? 'pipe ' + addr
    : 'port ' + addr.port;
  console.log('Listening on ' + bind);
}
wwwEND

cd ..

take .ebextensions


# ===================   CREATES elastic beanstalk config FILE
cat > 00_files.config <<ebfile1END
files:
    "/etc/nginx/conf.d/proxy.conf" :
        mode: "000755"
        owner: root
        group: root
        content: |
           client_max_body_size 3000M;

ebfile1END

cd ..

take src

# ===================   CREATES index.html FILE
cat > index.html <<indexEND
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>$appName</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
  <base href="/">
  <link rel="icon" href="favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">

  <!-- Minified CSS -->
  <link rel="stylesheet" href="main.css">

  <!-- 3RD PARTY dependencies -->
  <script src="angular/angular.js"></script>

  <!-- UI Router -->
  <script src="angular-ui-router/release/angular-ui-router.js"></script>
  <script src="angular-resource/angular-resource.js"></script>

  <!-- DATE / TIME TOOLS -->
  <script src="moment/moment.js"></script>
  <script src="angular-moment/angular-moment.js"></script>

  <!-- JQuery -->
  <script src="jquery/dist/jquery.js"></script>
  <script src="aws-sdk/dist/aws-sdk.js"></script>


</head>

<body ng-app="app">
  <div ui-view></div>
</body>

<!-- Minified code -->
<script src="main.js"></script>

</html>
indexEND

take app

# ===================   CREATES angular config FILE
cat > app.js <<ngappEND
'use-strict';

// import any new components here and inject them into app
require('./components/home/home.component.js');
require('./components/nav/nav.component.js');
require('./services/home.service.js');


const app = angular.module('app', [
  'ui.router',
  'angularMoment',
  'home',
  'nav',
]).config(config);

config.$inject = ['$stateProvider', '$urlRouterProvider', '$locationProvider']; // DEPENDENCY INJECTION INTO CONFIG

function config($stateProvider, $urlRouterProvider, $locationProvider) {

  $locationProvider.html5Mode(true); // Setting clean URLs (no hashtags from button clicks)

  $stateProvider
    .state({
      name: 'nav',
      abstract: true,
      templateUrl: 'app/components/nav/nav.template.html'
    })
    .state({
      name: 'home',
      parent: 'nav',
      url: '/',
      templateUrl: 'app/components/home/home.template.html'
    })
}

ngappEND

take components

take home
# comment IT CURRENTLY REMOVES ALL DOLLAR SIGNS $

# cat > home.component.js <<homecompEND
# angular.module('home', []).controller('homeCtrl', ['HomeService', function(HomeService) {
#
#   let vm = this
#   vm.$onInit = onInit
#   vm.$all = $all
#   vm.$newHome = $newHome
#   vm.$hush = $hush
#   vm.$change = $change
#   vm.$toggle = $toggle
#   vm.secret = []
#
#   function onInit() { // LOAD ALL POSTS AS SOON AS THE PAGE LOADS
#     return $all()
#     console.log('wow')
#   }
#
#   function $all() { // GET ALL POSTS
#     HomeService.$all()
#       .then((all) => {
#         vm.secrets = all
#       })
#   }
#
#   function $newHome() { // CREATE NEW CLASSIFIED OBJECT
#     HomeService.newHome(vm.newHome)
#     delete vm.newHome
#   }
#
#   function $hush(id) { // BURN YOUR CLASSIFIED OBJECTS AND LEAVE NO TRACES BENHIND
#     HomeService.$hush(id.id)
#   }
#
#   function $toggle(secret, $index) { //  CLASSIFIED INFO FORM DROP DOWN FORM FIELD
#     vm.secret[$index] = !vm.secret[$index] // TOGGLES THE EDIT FORM ON A SPECIFIC PIECE OF INFO
#     vm.changing = angular.copy(secret) // GRABS CURRENT CLASSIFIED INFO AND FILLS OUT FORM FIELDS WITH SAID HUSH HUSH STUFF
#   }
#
#   function $change(edit) { // SUBMIT FUNCTION FOR YOUR EDITED DATAS
#     HomeService.$change(vm.changing) // HITS MY SERVICE UP FOR AN AJAX CALL
#   }
# }]);
# homecompEND


echo  'angular.module('home', []).controller('homeCtrl', ['HomeService', function(HomeService) {

  let vm = this
  vm.$onInit = onInit
  vm.$all = $all
  vm.$newHome = $newHome
  vm.$hush = $hush
  vm.$change = $change
  vm.$toggle = $toggle
  vm.secret = []

  function onInit() { // LOAD ALL POSTS AS SOON AS THE PAGE LOADS
    return $all()
    console.log('wow')
  }

  function $all() { // GET ALL POSTS
    HomeService.$all()
      .then((all) => {
        vm.secrets = all
      })
  }

  function $newHome() { // CREATE NEW CLASSIFIED OBJECT
    HomeService.newHome(vm.newHome)
    delete vm.newHome
  }

  function $hush(id) { // BURN YOUR CLASSIFIED OBJECTS AND LEAVE NO TRACES BENHIND
    HomeService.$hush(id.id)
  }

  function $toggle(secret, $index) { //  CLASSIFIED INFO FORM DROP DOWN FORM FIELD
    vm.secret[$index] = !vm.secret[$index] // TOGGLES THE EDIT FORM ON A SPECIFIC PIECE OF INFO
    vm.changing = angular.copy(secret) // GRABS CURRENT CLASSIFIED INFO AND FILLS OUT FORM FIELDS WITH SAID HUSH HUSH STUFF
  }

  function $change(edit) { // SUBMIT FUNCTION FOR YOUR EDITED DATAS
    HomeService.$change(vm.changing) // HITS MY SERVICE UP FOR AN AJAX CALL
  }
}]);'

> home.component.js


# ===================   CREATES ___ FILE
cat > home.template.html <<hometempEND
<div id="home" ng-cloak ng-controller="homeCtrl as $ctrl">

  <div id="search">
    <input type="search" ng-model="search" placeholder="Search">
    <div class="pull-right">
      <label for="sort">  Sort by</label>
      <select ng-model="sort">
               <option name="sort" value="-created_at">Newest</option>
               <option name="sort" value="created_at">Oldest</option>
               <option name="sort" value="price">Price Lowest</option>
              <option name="sort" value="-price">Price Highest</option>
             </select>
    </div>
  </div>

  <div>
    <div id="newguy">
      <form ng-submit="$ctrl.$newHome()">
        <div>
          <label for="title">Title</label>
          <input ng-model="$ctrl.newHome.title" type="text">
        </div>
        <div>
          <label for="description">Description</label>
          <textarea ng-model="$ctrl.newHome.description" type="text"></textarea>
        </div>
        <div>
          <label for="price">Price</label>
          <input ng-model="$ctrl.newHome.price" type="text">
        </div>
        <div>
          <label for="item_image">Item Image</label>
          <input ng-model="$ctrl.newHome.item_image" type="url">
        </div>
        <div>
          <button type="submit">Share your secret</button>
        </div>
      </form>
    </div>
  </div>


  <!-- REPEAT -->
  <div id="wtf">
    <div id="secrets" ng-repeat="secret in $ctrl.secrets | filter:search | orderBy:sort">
      <div>
        <h3 id="title"> {{ secret.title }} </h3>
        <div id="body"> {{ secret.description }}</div>

        <div><img id="guys" ng-src="{{ secret.item_image }}"></div>
        <p id="price">${{ secret.price }}</p>

        <input type="button" ng-click="$ctrl.$toggle(secret, $index)" value="Edit Your Home">
        <input type="button" ng-click="$ctrl.$hush({id: secret.id})" value="Remove Your Home">

        <div id="editeroo" class="col-md-8" ng-if="$ctrl.secret[$index]">
          <form ng-submit="$ctrl.$change(secret)">
            <div>
              <label for="title">Title</label>
              <input ng-model="$ctrl.changing.title" type="text">
            </div>
            <div>
              <label for="description">Description</label>
              <textarea ng-model="$ctrl.changing.description" type="text"></textarea>
            </div>
            <div>
              <label for="price">Price</label>
              <input ng-model="$ctrl.changing.price" type="text">
            </div>
            <label for='item_url'>Item Image</label>
            <input ng-model="$ctrl.changing.item_image" type="url">
            <div>
              <button type="submit">Save Home</button>
            </div>
          </form>
        </div>

      </div>
    </div>

    <!-- END REPEAT -->
  </div>
</div>
hometempEND



cd ..

take nav


# ===================   CREATES ___ FILE
cat > nav.component.js <<navcompEND
angular.module('nav', [])
  .controller('navCtrl', [function() {
    const vm = this;
    vm.$onInit = onInit;

    function onInit() {

    }

  }]);
navcompEND


cat > nav.template.html <<navtempEND
<div id="nav">
            <a href="/">$appName LOGO GOES HERE THIS SHOULD BE A BUTTON</a>
            <ul>
              <li>
                <a href="/"> Home</a>
              </li>
            </ul>
        <!-- UI-ROUTER  -->
        <ui-view></ui-view>
</div>
navtempEND

cd ..
take css

# ===================   CREATES ___ FILE
cat > style.css <<cssEND
/* WRITE CUSTOM CSS IN HERE */

/* ANGULAR NAV TEMPLATE */
#nav{
height: 10vh;
width: 100vw;
background-color: red;
}

/* ANGULAR HOME TEMPLATE */
#home{
background-color: aqua;
height: 90vh;
width: 100vw;
}

/* ANGULAR PROJECTS TEMPLATE */
#projects{
height: 90vh;
width: 100vw;
background-color: green;
}

/* ANGULAR TUTORIALS TEMPLATE */
#tutorials{
height: 90vh;
width: 100vw;
background-color: yellow;
}






/* +++++++++++++++++++++++++++++++ DELETE ++++++++++++++++++++++ */



#secrets {
  /*height: 200px;
  width: 200px;*/
  max-width: 50%;
  max-height: 50%;
  background-color: red;
  margin-left: auto;
  margin-right: auto;
}

#guys {
  max-width: 75%;
  max-height: 75%;

}

#title {
  background-color: green;
  color: white;
  border-bottom: 10px solid orange;

}

#body {
  background-color: pink;
}

#price {
  background-color: aqua;
  font-size: 150%;
}

#editeroo {
  background-color: brown;
}

#contenteroo {
  margin-left: auto;
  margin-right: auto;
}

#search {
  background-color: #824247
}

#newguy {
  background-color: #776252;
  margin-left: 25%;
  margin-right: 25%;
}
cssEND


cd ..
take services

# ===================   CREATES ___ FILE
cat > home.service.js <<homeserviceEND

(function() {
  'use strict'

  angular.module('home')
    .service('HomeService', service) //MY 'AJAX' CALLS TO /server/routes/home.js
  service.$inject = ['$http']

  function service($http) {
    this.$all = function() { // GET ALL CLASSIFIED INFO
      return $http.get('/api/home').then((all) => {
        return all.data
      })
    }
    this.newHome = function(newHome) { // CREATE NEW CLASSIFIED OBJECT
      console.log('HomeService post request = ', newHome)
      $http.post('/api/home', newHome)
    }
    this.$hush = function(id) { // DELETE CLASSIFIED OBJECT
      return $http.delete(`/api/home/${id}`)
    }
    this.$change = function(edit) { // 'EDIT' CLASSIFIED OBJECT
      $http.patch(`/api/home/${edit.id}/`, edit)
    }
  }
})();

homeserviceEND

cd ..


# ===================   CREATES ___ FILE
# cat > TEMP <<TEMPEND
# add files here
# TEMPEND

# END OF CRUD
}
```
