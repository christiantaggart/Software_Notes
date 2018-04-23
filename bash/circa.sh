# ___________________ ANGULAR TEMPLATE______________________
# TODO: COPY files from template that are not custom https://www.cyberciti.biz/faq/copy-command/



# Comment Key:
#
# For every Directory that is created this will be above the method:
# ^^^^^D_I_R_E_C_T_O_R_Y_________ CREATE <DirectoryName> ^^^^^DIRECTORY^^^^^
#
#
# For every File that is created this will be above the method:
# *****F_I_L_E___________________ CREATE <FileName> *****FILE*****
#
#
# For every CLIENT Input retrieved this will be above the method:
# ~~~~~CLIENT-INPUT~~~~~ Getting CLIENT input for <VARIABLE_NAME> ~~~~~
#
#
# For simple explanations of functionality:
# NOTE ==> <functionality_summary>
#
#
# Prompting a client:
# 🔔 NOTE ==> <Prompt_Summary>
#
# For Readability each chunk of functionality will end with:
# !==>_____D_O_N_E__<functionality_summary>
#
# For Code Clarity Every Chunk of functionality will be separated with:
  #
  # _____________________________________________________________________________
  #                                 BREAK
  # _____________________________________________________________________________
  #
  #
# END Comment Key;



# 🔔 NOTE ==> Initial Prompt requesting Client input for Application name
echo "AngularJS Express PostgreSQL Scaffolding
✍️    NAME THAT APP:   📝 "
# ~~~~~CLIENT-INPUT~~~~~ Retrieving value for appName ~~~~~
# (Storing Client Input as appName)
read appName
  #
  # _____________________________________________________________________________
  #                                 BREAK
  # _____________________________________________________________________________
  #
  #
# NOTE ==> Regex to check for alphanumeric characters in appName
appName=${appName//[^a-zA-Z0-9_]/}
if [[ -z $appName ]] ; then
   echo "Please enter app name with alphanumeric characters only"
   echo "Remember there must be a length for the file names!"
   return 0
fi
# !==>_____D_O_N_E__<Retrieving client input for application name>
  #
  # _____________________________________________________________________________
  #                                 BREAK
  # _____________________________________________________________________________
  #
  #

# ^^^^^D_I_R_E_C_T_O_R_Y_________ CREATE $appName ^^^^^DIRECTORY^^^^^
# NOTE ==> Create Directory named VIA Client input)
mkdir $appName
cd $appName
  #
  # _____________________________________________________________________________
  #                                 BREAK
  # _____________________________________________________________________________
  #
  #

# *****F_I_L_E___________________ CREATE README.md *****FILE*****
touch README.md
cat > README.md << endReadme
# $appName
##### Built with: Christians Instant C.R.U.D Application

endReadme

# *****F_I_L_E___________________ CREATE package.json *****FILE*****
# NOTE ==> Populates name with appName Variable and Author with Current username
# !!!! MAY BE BROKEN REPLACED "ui-router": "^1.0.0-alpha.3", with     "@uirouter/angularjs": "^1.0.15",
cat > package.json <<PKGJSONEND
{
  "name": "$appName",
  "author": "$USER",
  "version": "0.0.1",
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
    "@uirouter/angularjs": "^1.0.15",
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
PKGJSONEND

#	🔔 NOTE ==> Prompt CLIENT package.json Has been Created
echo " 	🔔 (☞ﾟヮﾟ)☞     package.json Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end



# *****F_I_L_E___________________ CREATE server.js *****FILE*****
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

# 🔔 NOTE ==> Prompt CLIENT server.js Has been Created
echo " 	🔔 (☞ﾟヮﾟ)☞     server.js Created"
  #
  # _____________________________________________________________________________
  #                                 BREAK
  # _____________________________________________________________________________
  #
  #

# *****F_I_L_E___________________ CREATE gulpfile.js *****FILE*****
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

#	🔔 NOTE ==> Prompt CLIENT gulpfile.js Has been Created
echo " 	🔔 (☞ﾟヮﾟ)☞     gulpfile.js Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end

# *****F_I_L_E___________________ CREATE export.sh *****FILE*****
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
#	🔔 NOTE ==> Prompt CLIENT export.sh Has been Created
echo " 	🔔 (☞ﾟヮﾟ)☞     export.sh Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end



# *****F_I_L_E___________________ CREATE .stylelintrc *****FILE*****
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
#	🔔 NOTE ==> Prompt CLIENT .stylelintrc Has been Created
echo " 	🔔 (☞ﾟヮﾟ)☞     .stylelintrc Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end


# *****F_I_L_E___________________ CREATE .gitignore *****FILE*****
cat > .gitignore <<gitignoreEND

.DS_Store
node_modules
.hiddenfiles

gitignoreEND
#	🔔 NOTE ==> Prompt CLIENT .gitignore Has been Created
echo " 	🔔 (☞ﾟヮﾟ)☞     .gitignore Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end




# *****F_I_L_E___________________ CREATE .eslintrc *****FILE*****
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
echo " 	🔔 (☞ﾟヮﾟ)☞     .eslintrc Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end


# *****F_I_L_E___________________ CREATE .eslintignore *****FILE*****
cat > .eslintignore <<eslintignoreEND
public/*

eslintignoreEND
echo " 	🔔 (☞ﾟヮﾟ)☞     .eslinignore Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end

#  INSTALL dependecies
npm i





# ===============================================================================
# ===============================================================================
#                               D A T A B A S E
# ===============================================================================
# ===============================================================================



# ~~~~~CLIENT-INPUT~~~~~ Getting CLIENT input for <databaseName> ~~~~~
echo "
💾💾💾 Name your DataBase 💾💾💾"
# NOTE ==> Storing DATABASE NAME AS VARIABLE databaseName
read databaseName
databaseName=${databaseName//[^a-zA-Z0-9_]/}
# Logic to detect if DATABASE Name is null =======================
if [[ -z $databaseName ]] ; then
   echo "Please enter database name with alphanumeric characters only"
   echo "Remember there must be a length for the database name!"
   return 0
fi

# ADDING Database STUFF__________________
psql <<deleteIfExists
drop database $databaseName;
deleteIfExists

psql <<createNewDatabase
create database $databaseName;
createNewDatabase



# *****F_I_L_E___________________ CREATE knex.js *****FILE*****
cat > knex.js <<knexEND
module.exports =
  require('knex')
  (require('./knexfile')[process.env.NODE_ENV || 'development'])

knexEND
#	🔔 NOTE ==> Prompt CLIENT knex.js Has been Created
echo " 	🔔 (☞ﾟヮﾟ)☞     knex.js Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end

# *****F_I_L_E___________________ CREATE knexfile.js *****FILE*****
# NOTE ==> database is named VIA CLIENT input as VARIABLE databaseName
cat > knexfile.js <<knexfileEND
module.exports = {
  development: {
    client: 'pg',
    connection: { database: '$databaseName' }
  },
  production: { client: 'pg', connection: process.env.DATABASE_URL }
};
knexfileEND


#	🔔 NOTE ==> Prompt CLIENT knexfile.js Has been Created
echo " 	🔔 (☞ﾟヮﾟ)☞     knexfile.js Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end


# ++++++++++++++ TABLE LOGIC

# Asking for user input for first name of table in database ============
echo "Lets name all the tables separated by a space 👍"

read table
# NOTE ==> If CLIENT Input is Less Than Zero exit table creation
if [[ -z $table ]] ; then # -z = null ============================
   echo "Remember there must be a length for the table name!"
   return 0 # exits
 else

numberOfTables=$(wc -w <<< $table) # gets word count of user input
echo  "number of tables == $numberOfTables"

# DETECT AMMOUNT OF TABLES -gt == Greater Than
  if [[ $numberOfTables -gt 1 ]]; then # if more than one table
  c=0 # current index

  # NOTE ==> Creating empty array to hold tables
  tableArr=()

  tables="$table" # NOTE ==> more than one table so table becomes tables

    for name in $tables;
    do
        tableArr+=("$name") # appending values to the empy tableArr array
        # echo "tableArr[@]== ${tableArr[@]}" # every element in the array so far (they get added through the loop)
        # echo "#tableArr[@]== ${#tableArr[@]}" # the ammount of elements in the array as integer
        echo "current element in the array: tableArr[c]== ${tableArr[c]}" # current element in the array
        echo "You maded a table named: $name"
        numberForSeed="$c"
        underScoreSeed="_"
        seedName=$numberForSeed$underScoreSeed$name
        echo "seedName== $seedName"
        c=$((c+1));

        # Creating Knex Seeds ============================================================
        knex seed:make $seedName

        # Creating Knex migrations ============================================================
        knex migrate:make $name


        # ADDING SEED DATA_____________________________
        cd seeds
        idseq=_id_seq
        cat > $seedName.js <<endSeed
exports.seed = function(knex, Promise) {
  // Deletes ALL existing entries
  return knex('$name').del()
    .then(function() {
        // Inserts seed entries
      return  knex('$name').insert([{
      	id:1,
        	title:'NES Classic',
        	description:'I got lucky and found it, and decided to charge 10x what it was worth.',
      	price:600,
      	item_image:'http://www.nintendo.com/images/page/nes-classic/nes-classic-edition-box.png',
        created_at: new Date('2016-06-26 14:26:16 UTC'),
        updated_at: new Date('2016-06-26 14:26:16 UTC')
      },{
      	id:2,
        	title:'Pikachu 9" Plush Stuffed Toy',
        	description:'Polyester fiber construction Officially licensed.',
      	price:10,
      	item_image:'https://images-na.ssl-images-amazon.com/images/I/41VwGotRZsL._SY300_.jpg',
        created_at: new Date('2016-06-26 14:26:16 UTC'),
        updated_at: new Date('2016-06-26 14:26:16 UTC')
      }]);
    }).then(() => {
      return knex.raw("SELECT setval('$name$idseq', (SELECT MAX(id) FROM $name));")
    });
};
endSeed
          cd ..

          # MIGRATION FILES __________________________________________
          cd migrations

          # SEARCH FOR STRING CONTAINING MIGRATION NAME ===============
          # find <path> -name *string* ======= . is current dir
          # find . -name *$name*
          # foundit=[read find . -name *$name*]

          cat > *$name* <<endMigrations

            exports.up = function(knex) {
              return knex.schema.createTable('$name', (table) => {
                table.increments().primary();
                table.string('title').notNullable();
                table.string('description').notNullable();
                table.decimal('price').notNullable();
                table.string('item_image').notNullable();
                table.timestamps(true, true);
              })
            };

            exports.down = function(knex) {
              return knex.schema.dropTableIfExists('$name');
            };

endMigrations

          cd ..

        # NOTE ==> If all tables have been created prompt CLIENT
        if [[ $c -eq $numberOfTables ]]; then
          echo "$c Tables Created: ${tableArr[@]}" # Number of Tables and Table Names
          echo "👍 Good Work, I know it was hard"
        fi
    done

  else # if only one table Print the table name to console
    echo "only one table made named $table" # if only one table print this name to console
  fi # End of if null=========================

fi # END of TableLogic




# ===============================================================================
# ===============================================================================
#                      END      D A T A B A S E     END
# ===============================================================================
# ===============================================================================











# ^^^^^D_I_R_E_C_T_O_R_Y_________ CREATE routes ^^^^^DIRECTORY^^^^^
mkdir routes
cd routes

# *****F_I_L_E___________________ CREATE home.js *****FILE*****
cat > home.js <<homerouteEND
const express = require('express')
const router = express.Router()
const knex = require('../knex')

router.route('/')
  .get((req, res) => {
    console.error('home')
    knex('$name').select()
      .then((all) => {
        res.send(all);
      });
  })

  .post((req, res) => {
    console.log('req.body ==== ', req.body)
    knex('$name').returning(['id', 'title', 'description', 'price', 'item_image'])
      .insert(req.body).then((item) => {
        res.send(item[0]);
        // console.log(item[0])
      });
  });

router.route('/:id')

  .patch((req, res) => {
    // console.log(req.params.id);
    knex('$name').where('id', req.params.id).returning(['id', 'title', 'description', 'price', 'item_image'])
      .update(req.body).then((item) => {
        res.send(item[0]);
      });
  })

  .delete((req, res) => {
    knex('$name').where('id', req.params.id).returning(['id', 'title', 'description', 'price', 'item_image'])
      .del().then((item) => {
        res.send(item[0]);
      });
  });

module.exports = router

homerouteEND
echo " 	🔔 (☞ﾟヮﾟ)☞     home.js Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end

cd ..




# ^^^^^D_I_R_E_C_T_O_R_Y_________ CREATE routes ^^^^^DIRECTORY^^^^^
mkdir bin
cd bin

# *****F_I_L_E___________________ CREATE www *****FILE*****
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

echo " 	🔔 (☞ﾟヮﾟ)☞     www Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end

cd ..

# ^^^^^D_I_R_E_C_T_O_R_Y_________ CREATE .ebextensions ^^^^^DIRECTORY^^^^^
mkdir .ebextensions
cd .ebextensions


# *****F_I_L_E___________________ CREATE elastic beanstalk config *****FILE*****

cat > 00_files.config <<ebfile1END
files:
    "/etc/nginx/conf.d/proxy.conf" :
        mode: "000755"
        owner: root
        group: root
        content: |
           client_max_body_size 3000M;

ebfile1END

echo " 	🔔 (☞ﾟヮﾟ)☞     00_files.config Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end

cd ..

# ^^^^^D_I_R_E_C_T_O_R_Y_________ CREATE src ^^^^^DIRECTORY^^^^^
mkdir src
cd src

# *****F_I_L_E___________________ CREATE index.html *****FILE*****
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
  <script src="@uirouter/angularjs/release/angular-ui-router.js"></script>
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

echo " 	🔔 (☞ﾟヮﾟ)☞     index.html Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end


# ^^^^^D_I_R_E_C_T_O_R_Y_________ CREATE src ^^^^^DIRECTORY^^^^^
mkdir app
cd app

# *****F_I_L_E___________________ CREATE app.js *****FILE*****
# NOTE ==>    CREATES angular config FILE
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

config.\$inject = ['\$stateProvider', '\$urlRouterProvider', '\$locationProvider']; // DEPENDENCY INJECTION INTO CONFIG

function config(\$stateProvider, \$urlRouterProvider, \$locationProvider) {

  \$locationProvider.html5Mode(true); // Setting clean URLs (no hashtags from button clicks)

  \$stateProvider
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
echo " 	🔔 (☞ﾟヮﾟ)☞     app.js Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end



# ^^^^^D_I_R_E_C_T_O_R_Y_________ CREATE components ^^^^^DIRECTORY^^^^^
mkdir components
cd components
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end


# ^^^^^D_I_R_E_C_T_O_R_Y_________ CREATE home ^^^^^DIRECTORY^^^^^
mkdir home
cd home

# *****F_I_L_E___________________ CREATE home.component.js *****FILE*****
cat > home.component.js << endHomeComponent
 angular.module('home', []).controller('homeCtrl', ['HomeService', function(HomeService) {

  let vm = this
  vm.\$onInit = onInit
  vm.\$all = \$all
  vm.\$newHome = \$newHome
  vm.\$hush = \$hush
  vm.\$change = \$change
  vm.\$toggle = \$toggle
  vm.secret = []

  function onInit() { // LOAD ALL POSTS AS SOON AS THE PAGE LOADS
    return \$all()
    console.log('$appName')
  }

  function \$all() { // GET ALL POSTS
    HomeService.\$all()
      .then((all) => {
        vm.secrets = all
      })
  }

  function \$newHome() { // CREATE NEW CLASSIFIED OBJECT
    HomeService.newHome(vm.newHome)
    delete vm.newHome
  }

  function \$hush(id) { // BURN YOUR CLASSIFIED OBJECTS AND LEAVE NO TRACES BENHIND
    HomeService.\$hush(id.id)
  }

  function \$toggle(secret, \$index) { //  CLASSIFIED INFO FORM DROP DOWN FORM FIELD
    vm.secret[\$index] = !vm.secret[\$index] // TOGGLES THE EDIT FORM ON A SPECIFIC PIECE OF INFO
    vm.changing = angular.copy(secret) // GRABS CURRENT CLASSIFIED INFO AND FILLS OUT FORM FIELDS WITH SAID HUSH HUSH STUFF
  }

  function \$change(edit) { // SUBMIT FUNCTION FOR YOUR EDITED DATAS
    HomeService.\$change(vm.changing) // HITS MY SERVICE UP FOR AN AJAX CALL
  }
}]);
endHomeComponent

#	🔔 NOTE ==> Prompt CLIENT home.component.js Has been Created
echo " 	🔔 (☞ﾟヮﾟ)☞     home.component.js Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end

# *****F_I_L_E___________________ CREATE home.template.html *****FILE*****
cat > home.template.html << endHomeTemplate
<div id="home" ng-cloak ng-controller="homeCtrl as \$ctrl">

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
      <form ng-submit="\$ctrl.\$newHome()">
        <div>
          <label for="title">Title</label>
          <input ng-model="\$ctrl.newHome.title" type="text">
        </div>
        <div>
          <label for="description">Description</label>
          <textarea ng-model="\$ctrl.newHome.description" type="text"></textarea>
        </div>
        <div>
          <label for="price">Price</label>
          <input ng-model="\$ctrl.newHome.price" type="text">
        </div>
        <div>
          <label for="item_image">Item Image</label>
          <input ng-model="\$ctrl.newHome.item_image" type="url">
        </div>
        <div>
          <button type="submit">Share your secret</button>
        </div>
      </form>
    </div>
  </div>


  <!-- REPEAT -->
  <div id="wtf">
    <div id="secrets" ng-repeat="secret in \$ctrl.secrets | filter:search | orderBy:sort">
      <div>
        <h3 id="title"> {{ secret.title }} </h3>
        <div id="body"> {{ secret.description }}</div>

        <div><img id="guys" ng-src="{{ secret.item_image }}"></div>
        <p id="price">\${{ secret.price }}</p>

        <input type="button" ng-click="\$ctrl.\$toggle(secret, \$index)" value="Edit Your Home">
        <input type="button" ng-click="\$ctrl.\$hush({id: secret.id})" value="Remove Your Home">

        <div id="editeroo" class="col-md-8" ng-if="\$ctrl.secret[\$index]">
          <form ng-submit="\$ctrl.\$change(secret)">
            <div>
              <label for="title">Title</label>
              <input ng-model="\$ctrl.changing.title" type="text">
            </div>
            <div>
              <label for="description">Description</label>
              <textarea ng-model="\$ctrl.changing.description" type="text"></textarea>
            </div>
            <div>
              <label for="price">Price</label>
              <input ng-model="\$ctrl.changing.price" type="text">
            </div>
            <label for='item_url'>Item Image</label>
            <input ng-model="\$ctrl.changing.item_image" type="url">
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
endHomeTemplate

#	🔔 NOTE ==> Prompt CLIENT home.template.html Has been Created
echo " 	🔔 (☞ﾟヮﾟ)☞     home.template.html Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end


cd ..

# ^^^^^D_I_R_E_C_T_O_R_Y_________ CREATE home ^^^^^DIRECTORY^^^^^
mkdir nav
cd nav

# *****F_I_L_E___________________ CREATE nav.component.js *****FILE*****
cat > nav.component.js <<navcompEND
angular.module('nav', [])
  .controller('navCtrl', [function() {
    const vm = this;
    vm.\$onInit = onInit;

    function onInit() {

    }

  }]);
navcompEND
#	🔔 NOTE ==> Prompt CLIENT nav.component.js Has been Created
echo " 	🔔 (☞ﾟヮﾟ)☞     nav.component.js Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end


# *****F_I_L_E___________________ CREATE nav.template.html *****FILE*****
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
#	🔔 NOTE ==> Prompt CLIENT nav.template.html Has been Created
echo " 	🔔 (☞ﾟヮﾟ)☞     nav.template.html Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end


cd ..
cd ..
# ^^^^^D_I_R_E_C_T_O_R_Y_________ CREATE css^^^^^DIRECTORY^^^^^
mkdir css
cd css

# *****F_I_L_E___________________ CREATE style.css *****FILE*****
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
#	🔔 NOTE ==> Prompt CLIENT style.css Has been Created
echo " 	🔔 (☞ﾟヮﾟ)☞     style.css Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end


cd ..

# ^^^^^D_I_R_E_C_T_O_R_Y_________ CREATE services^^^^^DIRECTORY^^^^^
mkdir services
cd services
# *****F_I_L_E___________________ CREATE home.service.js *****FILE*****
cat > home.service.js <<homeserviceEND

(function() {
  'use strict'

  angular.module('home')
    .service('HomeService', service) //MY 'AJAX' CALLS TO /server/routes/home.js
  service.\$inject = ['\$http']

  function service(\$http) {
    this.\$all = function() { // GET ALL CLASSIFIED INFO
      return \$http.get('/api/home').then((all) => {
        return all.data
      })
    }
    this.newHome = function(newHome) { // CREATE NEW CLASSIFIED OBJECT
      console.log('HomeService post request = ', newHome)
      \$http.post('/api/home', newHome)
    }
    this.\$hush = function(id) { // DELETE CLASSIFIED OBJECT
      return \$http.delete(\`/api/home/\${id}\`)
    }
    this.\$change = function(edit) { // 'EDIT' CLASSIFIED OBJECT
      \$http.patch(\`/api/home/\${edit.id}/\`, edit)
    }
  }
})();
homeserviceEND

#	🔔 NOTE ==> Prompt CLIENT home.service.js Has been Created
echo " 	🔔 (☞ﾟヮﾟ)☞     home.service.js Created"
  #
  # _____________________________________________________________________________
  #
  # _____________________________________________________________________________
  #
  #  end


cd ..
cd ..

knex migrate:rollback
knex migrate:latest
knex seed:run

npm run dev



/usr/bin/open -a "/Applications/Google Chrome.app" 'http://localhost:8080'




# End of circa()
