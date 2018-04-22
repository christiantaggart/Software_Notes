## CIRCA:
- CHRISTIANS Instant CRUD APP
_C.R.U.D._ Is an acronym for Create Read Update Delete

- Non-tested as of 2018;
- Use at your own risk.


---

```sh
circa(){
echo "
    C.I.R.C.A.
CHRISTIANS INSTANT RESTful CRUD APP
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

# Setting view template to handlebars =================================
express --view=hbs $appName

cd $appName/

# Creating gitignore ==============================================
touch .gitignore

# adding node_modules & DS_Store to gitignore ========================
echo 'node_modules' >> .gitignore
echo '.DS_Store' >> .gitignore

# cat <<EOF
# MMMMMMMMMMMMMMMMMMMMMMMMMMMNMNNmmmmmNNNMMMMMMMMMMMMMMMM
# MMMMMMMMMMMMMMMMMMMMMMMNNNNNNNNmmmmddhyhmmNNMMMMMMMMMMM
# MMMMMMMMMMMMMMMMMMMMNmmNNNNMMMMMNNNNNmhhddyydNMMMMMMMMM
# MMMMMMMMMMMMMMMMMMNmmmmmNNNMMMMNNNNNNNNdmNmhhhdNMMMMMMM
# MMMMMMMMMMMMMMMMMNmdmmmmNNNNMMMNNNNNNNNmmNNmmdhdNMMMMMM
# MMMMMMMMMMMMMMMMmmdmmmmmmNMMNmdddhhyyyyhhmNMNmdmmNMMMMM
# MMMMMMMMMMMMMMNNmmNmmmmNMNdysooooooooooosshmNNNNNNMMMMM
# MMMMMMMMMMMMMNNmNNNNNmNMmhs++++++++++++++++oymMMNNMMMMM
# MMMMMMMMMMMMNNNNNNNNNNMmyo//+++++++++++++++++ymMMMNMMMM
# MMMMMMMMMMMNmNNNNNNNMMmy+:/++////+++++++++ooosdMMMMMMMM
# MMMMMMMMMMNmNNNNNNNNMmysooosyhhyo+++++++++oosshMMMMMMMM
# MMMMMMMMMNmNNNNNNMNMmyshNNNNNmddyo++++++++++oshMMMMMMMM
# MMMMMMMMNmmNNNNMMNNNyoooyhdNNNNdhs+osyhmmdysosmMMMMMNMM
# MMMMMMMNNmNNNNMMMNMds+++ossyyyysso/odmNNmdhyyhNMMMMMMMM
# MMMMMNNNmNNNNNMMMNNho++++++++oo++//ohhydNMMMmmMMMMMMMMM
# MMMMNNNmmNNNNMMMMNNhysooooooo+::///ososyhhdddNMMMMMMMMM
# MMNNNNNmNNNNNMMMMNNhyssooooo++/////os+++++osmMMMMMMMMMM
# NNNNNNmmNNNNMMMMMNmhyso++++osyhhhhysyo+++osdMMMMMMMMMMM
# NNNNNmmNNNNNMMMMMNmyysoooyyyyssyyyssyssssydMMMMMMMMMNMM
# MMMMNmmNNNNMMMMMMMmysssssosyyhdddysshyhddmMMMMMMMMMMNNM
# MNNNMNNNNNNMMMMMMMNhyssssssyhhhhhhdhhddmNMMMMMMMMMMMMNM
# NNNMMNNNMNMMMMMMMMMmhysoooosyyyyyyhdddmNMMMMMMMMMMMNNNM
# MMMMMNNMMMMMMMMMMMMMNdyssooosyhhhhddmNMMMMMMMMMMMMNNNMM
# NNMMMNNMMMMMMMMMMMMMMNNddhhhyhddmmNMMMMMMMMMMMMMMMNNNMM
# mmNNNNNMMMMMMMMMMMMMMNNMMNNNNNMMMMMMMMMMMMMMMMMMMMNNNNM
# NNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNNNNM
# dmMNMNNMMMMMMMMMMMMNNNNNNMMMMMMMMMMMMMNMMMMMMMMMMMMMNNM
# EOF

# installing node module dependencies =============================

npm i

npm i --save knex pg bcrypt humps jsonwebtoken


echo "Working on it.. 🔧"
# cat <<EOF
# MMMMMMMMMMMMMMNMNhhhyysyhhyoohh/o+/ysohymMMMMMMMMMMMMMM
# MMMMMMMMMMmyyy+o+syyhyy:::+::o:./-:+-:+oohdNdNMMMMMMMMM
# MMMMMMMMNyyo+s+/::y:/::.-.....-..`...-:/://o++hNMMMMMMM
# MMMMMMmdsos+--/....-...-.-...........`.::/-/:o/odMMMMMM
# MMMMMhyo//s/-.....-://::--.-..--.....``.--`-::+/oNNMMMM
# MMdsoo+//::::...---:+oo:-:---/:--....-...`-.---:o+NMMMM
# MMm+//:--/-....--//:/o+:-///:-:-------...--...---sydMMM
# Mdo::/-..---.-----/:/os/+++/++://:/::::--:-.....///yMMM
# Md+/-::..-----:::::::+o/+++/+:/+//////+///:-..----+oNMM
# Nd+:-....--:/++++/+////:::::::////++++++///:--.-:-+sMMM
# yo//------:/++//:::::-::::::::////+++ooo+///----:/++hMM
# mo+--...---://::------:::::::://///++ooooo+/:--:::/+yMM
# Nsoo+:.--::://:-------:::::/:/:::://++ooooo/--:::::dMMM
# Moo/:---:::://---...---::://::::/++osyyhhhyo/-::::/ssmM
# Mdyo:--://:://------:://///////+shddddhhdddhs/-://:oohM
# NNso+:-::/:/+//oosyyyhhys+///+osyyysoossyyyhys/:::/hdym
# mho+o/-:/::/+oysooooossoo+/::+syyyyshdmdddhyyyo+///yhhd
# MMdss+--:-:++o+//++syhyss+::/+syyyyyyhhyyhysssso+:+yyym
# MMMNy+/:/:/+////osoyhhsso////+syyyssssssssssssyyo:oyysN
# MMMMN//+o/+/::::///++oo+////:+syyyssossooooossyyyoshysM
# MMMMM+s+ooo+/:::::////:::::/:/syyyysoooooooossyyysyysmM
# MMMMMhoo+oo+/::---:::::::://:/+syyyyysoooooossyyyyyyhMM
# MMMMMMho++oo/::----:::///////+oshdhyyssssssssyyyhhssdMM
# MMMMMMMmo++o+:::--://++/:/ooosydddhyyyyhyyssyhhhdhhyNMM
# MMMMMMMMdo++o//////++++/+osyyhhyhhyyyyhhhhyyyhhhdmMMMMM
# MMMMMMMMMd++o+///+++oyyyyssooosoyhhdhddhhyyyhhhhdmMMMMM
# MMMMMMMMMMdhyo+++/++oyyooo+ooossyyyyyyssyyyyhhhddmMMMMM
# MMMMMMMMMMMMNso++++++os/::///+oooooossyyhhyhhdddNMMMMMM
# MMMMMMMMMMMMMNyoo++++oho//////++++++ossyhdhhdddhmNMMMMM
# MMMMMMMMMMMMMMNssso++sdys+///+++++oyssyhmmddmmhdddhdNNN
# MMMMMMMMMMMMMMMMyhysshmmddhyssoooosyhdmNNNmmmhyydmmmmdh
# MMMMMMMMMMMMMMMMddhhdmmmmmmmmdyooosdNNNNNNmdhyyyyhmddmd
# MMMMMMMMMMMMMMNmdNdsyhdddddddddyssydmmmmmdhyyysyyymNydh
# MMMMMMMMMMMNdddNNNmmsoosyyhhhhhhhhhdhhhhhyysssssydmNmmh
# MMMMMMMMMmdymmddNdmmyyo+oosssssoossyyhhyyysssssydmNNNmy
# MMMMMMMhssdhyNmymydNydmhyooooooooosyyyyysssssssdmNNNNNN
# MMMNmdddmddhsmmyNdhhhNNNNmmhyoooosyyyyyssoossshmNNNNNNN
# mhhmNNdshyhhmssoyy+/odNNNNNNNNmhyssssssooossssmNNNNNNNN
# mNNNNNmyydd++ysymmmmNNNNNNNNNNNNNNdsosooossyydNNNNNNNNN
# EOF


# Creating knex.js file ============================================
touch knex.js

# Creating knexfile.js file ============================================
touch knexfile.js
# configuring knex.js file ============================================
cat > knex.js << Enderoo
const environment = process.env.NODE_ENV || 'development';
const knexConfig = require('./knexfile')[environment];
const knex = require('knex')(knexConfig);
module.exports = knex;
Enderoo




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

d=_dev
t=_test
db=$dataFortress
dbd=$db$d
dbt=$db$t
echo "DEV DATABSE IS:  $dbd"
echo "TEST DATABASE IS:  $dbt"


# Creating DATABASE Link in knexfile.js  =============================== KNEXFILE.JS  ======
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


# Asking for user input for first name of table in database ============
  echo " Lets name all the tables you want separated by a space 👍"

# Naming first table table_name ===================================
  read table
  if [[ -z $table ]] ; then # -z = null ============================
     echo "Add some length to that bad boy and come back later"
     return 0 # exits ==============
   else
nTables=$(wc -w <<< $table) # gets word count of user input
# tableArr=()
# echo "${tableArr[@]}" # every element in the array
# echo "${#tableArr[@]}" # the ammount of elements in the array as integer
# echo "${tableArr[0]}" # first element in the array
c=1
  if [[ $nTables -gt 1 ]]; then # if more than one table
  tables="$table"
  echo "
  Starting server installation.
  Application Name: $appName.
  DatabaseName: $dbd && $dbt "
    for name in $tables; do
      echo "You maded a table named: $name"
      numberForSeed="$c"
      underScoreSeed="_"
      seedName=$numberForSeed$underScoreSeed$name
      # echo $seedName

      read $seedName

      c=$((c+1));

      # Creating Knex Seeds ============================================================
      knex seed:make $seedName

      read "$name"
        # Creating Knex migrations ============================================================
        knex migrate:make $name

        # ADDING SEED DATA_____________________________
        cd seeds
        idseq=_id_seq
        cat > $seedName.js <<fin
        exports.seed = function(knex, Promise) {
          // Deletes ALL existing entries
          return knex('$name').del()
            .then(function() {
              return Promise.all([
                // Inserts seed entries
                knex('$name').insert([{
                  id: 1,
                  varchar: 'Rowling',
                  email: 'jkrowling@gmail.com',
                  hashed_password: 'cptcptcptcptcptcptcptcptcptcptcptcptcptcptcptcptcptcptcptcpt',
                  created_at: new Date('2016-06-29 14:26:16 UTC'),
                  updated_at: new Date('2016-06-29 14:26:16 UTC')
                }])
              ]);
            }).then(() => {
              return knex.raw("SELECT setval('$name$idseq', (SELECT MAX(id) FROM $name));")
            });
        };
fin
cd ..
# MIGRATION FILES __________________________________________
cd migrations

# SEARCH FOR STRING CONTAINING MIGRATION NAME ===============
# find <path> -name *string* ======= . is current dir
# find . -name *$name*
# foundit=[read find . -name *$name*]

cat > *$name* <<MNEND
exports.up = function(knex) {
  return knex.schema.createTable('$name', (table) => {
    table.increments();
    table.string('varchar').notNullable().defaultTo('');
    table.string('email').notNullable().unique();
    table.specificType('hashed_password', 'char(60)').notNullable();
    table.timestamps(true, true);
  });
};

exports.down = function(knex) {
  return knex.schema.dropTableIfExists('$name');
};
MNEND

cd ..

    done
else

  echo "only one table made named $table" # if only one table print this name to console
fi
# part of toms if null=========================
fi



# ADDING ROUTES__________________
cd routes

cat > index.js <<RNEND
//Routes
'use strict';
const r = require('express').Router();
const k = require('../knex');
const humps = require('humps');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken')
//HANDLING ALL MY ROUTING @ ONCE 👨🏻 LiL_Code

r.route('/').get((req, res) => {
    res.render('index')
}).post((req, res) => {
  k('$name')
  .returning(['id', 'varchar', 'email', ])
    .insert(humps.decamelizeKeys(req.body))
    .then((oneThing) => {
      res.send(humps.camelizeKeys(oneThing[0]));
    }).done();
});
// ------------------------- BY ID -----------------------------
r.route('/:id')
.get((req, res) => {
  let id = req.params.id;
    k('$name')
    .where('id', id)
    .then((oneThing) => {
    res.send(humps.camelizeKeys(oneThing[0]));
  })
})
.patch((req, res, next) => {
  k('$name')
    .where('id', req.params.id)
    .update({ message: req.body.message }) //Thing you're updating (editing / patching)
    .returning(['id', 'name', 'message'])
    .then((edit) => {
      res.send(edit[0])
    })
})

//.patch((req, res) => {
//  let id = req.params.id;
//  k('$name').where('id', id).returning(['id', 'varchar',  'email' ])
//    .update(humps.decamelizeKeys(req.body)).then((oneThing) => {
//      res.send(humps.camelizeKeys(oneThing[0]));
//    });
.delete((req, res) => {
  let id = req.params.id;
  k('$name')
  .where('id', id)
  .returning(['id', 'varchar', 'email', ])
    .del().then((oneThing) => {
      res.send(humps.camelizeKeys(oneThing[0]));
    });
});
module.exports = r;
RNEND




cd ..

# ADDING BOOTSTRAP_____________________________________________
cd views/

cat > index.hbs <<Fn

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>$appName</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Custom CSS -->
    <link href="/stylesheets/style.css" rel="stylesheet">
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
</head>
<body style="background-image: url(http://i.imgur.com/UTOP7ap.png);">
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
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>$appName $appName $appName $appName</h1>
                <p>Note: You may need to adjust some CSS based on the size of your logo. The default logo size is 150x50 pixels.</p>
            </div>
        </div>
    </div>

    <iframe width="1120" height="630" src="https://www.youtube.com/watch?v=3eRBFkxgG7g" frameborder="0" allowfullscreen></iframe>
    <img src="https://media.giphy.com/media/l4FGwa9GQF3uNtFba/200w.gif">
    <form method='get' action="/messages">
    meme?:<br>
    <input type="text" name="meme" value="meme"><br>
    <br>
    <input type="submit" value="Submit">
  </form>
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
[lil-code Notes on GitHub](https://github.com/lil-code/Software_Notes)
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

# cat << endr
#  HERE COME DAT BOi
# .-:/++oss+`
#       -syyyyyyyyymNdy.
#       `ymdddhhhyhdddhh/
#        `sNNNNmmddhhhyyh/
#          :mNNNNNmmmdhyyy.
#           `ommdddddhyysys`
#            .dddhhhhyysssyo
#           .sddhhhhhhhysyhd+
#      `.:/+ydddddhhhhhhysyyh+
# `.-:oyhhhdho-hdhhhyhhhhhyyyh:
# `-/+ssyyhhhyso/` `hhhyyyyhhhdhhyys/-.
# `  `.-oyyhhyys+:```     :dhhyyyhhhhhyyyhh.
# :+shddd/.````           /dhhhhhhhhhhyhhdh
# `.::.                 -dddhhhhhhhhhhhys
#             `hddddddddddddhsy/
#            .yhdmddddddddmmdysys-
#           -yhhddmmmmmmmmmmmhsyhs.
#          -hdddddmmmddmmNNNmhyyhhy`
#         -hddmmmmhs+oyhmmNNmdyyyhh:
#       `/hmmmhs//shmmmdhhdddhhyyhhs
#       ohmm+.`  .::--s-......yhyhhs
#      .hhdmo`        o       .yyhh+
#       +hhhdy-       o        +yhd:
#        .+yhdd/     ./`      :ssyh`
#          ./syds-../y+/`    -ysyhh
#             -ydddmNmhsdho-`oyyyds
#           .+hmmddNmhoydNNNhhyyhd-
#         `/hmdddyyhd/:y+:ommyyydy
#        `smdh/:oyood-/y- `+hyyhd-
#       `ymhs:` `+-/h`/s `o/hyydd`
#       smhs..:. `++y.+-`/`/yyhmm+
#      :ddy.  `-/``ys/+-+`.yyhdmmd`
#      ymyy---.``-:yho++---yhd+ymm-
#     `dmy-`..-:--ohddoo/-/yho:smm:
#     .mmy.`.--:/:oyddyo+-oyy` omm-
#     .mmy+:-....//oymo+./yho:-hmm`
#     `dmh/  `-/-.+:sy+o.syy `/mms
#      omdh--:. ././/+sooyh/..dmm.
#      .dmds.  -/..o`/+-oys .dmm/
# `...``..................../mmds`::` // /+.oh+:dmd+
# `-::///::///++oooymmmdy+--/: /sshddhhh/
#     `:/osdNmmmddhyshhdNmmmh:
# `-/:--.`:oohdNmmmmmNNNNdy+:-
# -//:-----:--.:+oso++o++:.
# endr

knx



# (/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome http://localhost:3000/) &

nodemon
atom .
}

# CRUD APP =========================================================================================================
# CRUD APP =========================================================================================================
# CRUD APP =========================================================================================================
# CRUD APP =========================================================================================================
```
