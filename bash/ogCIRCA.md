``` bash

#------------------------------------------------
# CRUD APP HAHAHAHAHA GET MEME'D  =================================================
#------------------------------------------------
circa(){
echo "
🍤  CPT  🍤   C.I.R.C.A.  🍤  CPT  🍤
CHRISTIANS INSTANT RESTful CRUD APP
🍤  NAME THAT BAD BOY:   🍤"
read appName
appName=${appName//[^a-zA-Z0-9_]/}

if [[ -z $appName ]] ; then
   echo "Please enter app name with alphanumeric characters only"
   echo "Remember there must be a length for the file names!"
   return 0
fi


echo "
QUICK GIMME A DB NAME!"
read dataFortress
echo "You chose $dataFortress as a database name!"
if [[ -z $dataFortress ]] ; then
   echo "Please enter database name with alphanumeric characters only"
   echo "Remember there must be a length for the database name!"
   return 0
fi

d=_dev
t=_test
db=$dataFortress
dbd=$db$d
dbt=$db$t
echo "DEV DATABSE IS:  $dbd"
echo "TEST DATABASE IS:  $dbt"


  echo "
 🍤🍤🍤🍤      Name your first table table plz    🍤🍤🍤🍤"
  read table1
  table1=${table1//[^a-zA-Z0-9_]/}

  if [[ -z $table1 ]] ; then
     echo "Please enter table name with alphanumeric characters only"
     echo "Remember there must be a length for the table name!"
     echo "must be alphanumeric brah"
     return 0
  fi

  echo "
  🍤🍤🍤🍤   Would you like to make more than one table? Type a name or hit enter if nah   🍤🍤🍤🍤"
  read tableNum

  if [[ -z $tableNum ]] ;  then
      echo "🍤🍤🍤🍤    Okay onto the next step    🍤🍤🍤🍤"
  else
    echo "🍤🍤🍤🍤    next table name is $tableNum    🍤🍤🍤🍤"
  fi

echo "
🍤🍤🍤🍤 Starting server installation. 🍤🍤🍤🍤
🍤🍤🍤🍤 Application Name: $appName. 🍤🍤🍤🍤
🍤🍤🍤🍤 Tables created: $table1 $tableNum. 🍤🍤🍤🍤
🍤🍤🍤🍤 DatabaseName: $dbd && $dbt 🍤🍤🍤🍤"
express --view=hbs $appName
cd $appName/
touch .gitignore
echo 'node_modules' >> .gitignore
echo '.DS_Store' >> .gitignore
npm i
echo "
🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤     SPONSORED    🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤
🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤    BY:   🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤
🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤
🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤     NSA     🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤
🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤     .        🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤
🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤     GOV     🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤
🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤
🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤"
npm i --save knex pg bcrypt humps jsonwebtoken
touch knex.js
touch knexfile.js
cat > knex.js << Enderoo
const environment = process.env.NODE_ENV || 'development';
const knexConfig = require('./knexfile')[environment];
const knex = require('knex')(knexConfig);
module.exports = knex;
Enderoo

cat > knexfile.js <<Endzo
module.exports = {
  development: {
    client: 'pg',
    connection: 'postgres://localhost/$dbd'
  },
  test: {
    client: 'pg',
  connection: 'postgres://localhost/$dbt'
}
};
Endzo
echo "
🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤  MEME   🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤
🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤   PRANKS   🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤
🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤   GONE   🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤
🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤   GRAPHIC   🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤"
knex migrate:make $table1
knex migrate:make $tableNum

knex seed:make $table1
knex seed:make $tableNum

# ADDING SEED DATA_____________________________
cd seeds
idseq=_id_seq
cat > $table1.js <<fin
exports.seed = function(knex, Promise) {
  // Deletes ALL existing entries
  return knex('$table1').del()
    .then(function() {
      return Promise.all([
        // Inserts seed entries
        knex('$table1').insert([{
          id: 1,
          first_name: 'Joanne',
          last_name: 'Rowling',
          email: 'jkrowling@gmail.com',
          hashed_password: 'cptcptcptcptcptcptcptcptcptcptcptcptcptcptcptcptcptcptcptcpt',
          created_at: new Date('2016-06-29 14:26:16 UTC'),
          updated_at: new Date('2016-06-29 14:26:16 UTC')
        }])
      ]);
    }).then(() => {
      return knex.raw("SELECT setval('$table1$idseq', (SELECT MAX(id) FROM $table1));")
    });
};

fin
cat > $tableNum.js <<finDos
exports.seed = function(knex, Promise) {
  // Deletes ALL existing entries
  return knex('$tableNum').del()
    .then(function() {
      return Promise.all([
        // Inserts seed entries
        knex('$table1').insert([{
          id: 1,
          first_name: 'Joanne',
          last_name: 'Rowling',
          email: 'jkrowling@gmail.com',
          hashed_password: 'cptcptcptcptcptcptcptcptcptcptcptcptcptcptcptcptcptcptcptcpt',
          created_at: new Date('2016-06-29 14:26:16 UTC'),
          updated_at: new Date('2016-06-29 14:26:16 UTC')
        }])
      ]);
    }).then(() => {
      return knex.raw("SELECT setval('$tableNum$idseq', (SELECT MAX(id) FROM $tableNum));")
    });
};
finDos

cd ..
# MIGRATION FILES __________________________________________
cd migrations
touch migrationNotes.md
cat > migrationNotes.md <<MNEND
exports.up = function(knex) {
  return knex.schema.createTable('$table1', (table) => {
    table.increments();
    table.string('first_name').notNullable().defaultTo('');
    table.string('last_name').notNullable().defaultTo('');
    table.string('email').notNullable().unique();
    table.specificType('hashed_password', 'char(60)').notNullable();
    table.timestamps(true, true);
  });
};

exports.down = function(knex) {
  return knex.schema.dropTableIfExists('$table1');
};
MNEND
cd ..

# ADDING ROUTES__________________
cd routes

cat > index.js <<RNEND
//Routes
'use strict';
const express = require('express');
const router = express.Router();
const knex = require('../knex');
const humps = require('humps');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken')
//HANDLING ALL MY ROUTING @ ONCE 👨🏻 LiL_Code

router.route('/').get((req, res) => {
    res.render('index')
}).post((req, res) => {
  knex('$table1').returning(['id', 'first_name', 'last_name', 'email', ])
    .insert(humps.decamelizeKeys(req.body)).then((oneThing) => {
      res.send(humps.camelizeKeys(oneThing[0]));
    }).done();
});
// ------------------------- BY ID -----------------------------
router.route('/:id')
.get((req, res) => {
  let id = req.params.id;
    knex('$table1').where('id', id).then((oneThing) => {
    res.send(humps.camelizeKeys(oneThing[0]));
  })
}).patch((req, res) => {
  let id = req.params.id;
  knex('$table1').where('id', id).returning(['id', 'first_name', 'last_name', 'email', ])
    .update(humps.decamelizeKeys(req.body)).then((oneThing) => {
      res.send(humps.camelizeKeys(oneThing[0]));
    });
}).delete((req, res) => {
  let id = req.params.id;
  knex('$table1').where('id', id).returning(['id', 'first_name', 'last_name', 'email', ])
    .del().then((oneThing) => {
      res.send(humps.camelizeKeys(oneThing[0]));
    });
});
module.exports = router;
RNEND
cd ..

# ADDING BOOTSTRAP_____________________________________________
cd views/
cat > index.hbs <<Fn

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>$appName</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Custom CSS -->
    <link href="/stylesheets/style.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">
                    <img src="http://i.imgur.com/UTOP7ap.png" alt="">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="/users">About</a>
                    </li>
                    <li>
                        <a href="#">Services</a>
                    </li>
                    <li>
                        <a href="/error">Error</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Logo Nav by Start Bootstrap</h1>
                <p>Note: You may need to adjust some CSS based on the size of your logo. The default logo size is 150x50 pixels.</p>
            </div>
        </div>
    </div>
<!-- /.container -->

    <!-- jQuery -->
    <script
    src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g="
    crossorigin="anonymous"></script>
    <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
Fn

cd ..

# ADDING README___________________________________
touch README.md
cat > README.md << DunDidIt

# 🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤
# Welcome to Christians Instant RESTful Crud App
# 🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤
![alt text](http://i.imgur.com/UTOP7ap.png "Try Your best get MeMe'd Like the Rest")
# 🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤

DunDidIt
# ADDING Database STUFF__________________
psql <<leave
drop database $dbd;
leave
psql <<leaf
drop database $dbt;
leaf

psql <<Exet
create database $dbd;
Exet
psql <<Escape
create database $dbt;
Escape
echo "
🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤    BOWIIIIIIIIIII    🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤
🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤        YOU            🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤
🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤      LOOKIN         🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤
🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤        SICK              🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤
🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤🍤     YOU ONLY YOLO ONCE USE IT SMART    🍤🍤🍤🍤🍤🍤🍤🍤"
atom .
}

```
