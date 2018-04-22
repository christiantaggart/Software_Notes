### Lil bash script for gathering input. I this used for generating Postgres tables;
- Will report back on functionality, Something was broken and haven't tested in a while.

```sh
logicTest(){
# Asking for user input for first name of table in database ============
  echo " Lets name all the tables you want separated by a space 👍"

# Naming first table table1 ===================================
  read table
  if [[ -z $table ]] ; then # -z = null ============================
     echo "Remember there must be a length for the table name!"
     return 0 # exits
   else
nTables=$(wc -w <<< $table) # gets word count of user input
# tableArr=()
# echo "${tableArr[@]}" # every element in the array
# echo "${#tableArr[@]}" # the ammount of elements in the array as integer
# echo "${tableArr[0]}" # first element in the array
c=0
  if [[ $nTables -gt 1 ]]; then # if more than one table
  tables="$table"
    for name in $tables; do
        # tableArr+=("$name") # appending values to the empy tableArr array
        # echo "$name"
        echo "You maded a table named: $name"
        numberForSeed="$c"
        underScoreSeed="_"
        seedName=$numberForSeed$underScoreSeed$name
        echo $seedName
        read $seedName
        read "$name"
        # eval "tableNum$c=$name";     # Dynamically creating variable names for each input
        c=$((c+1));
        # echo "$name"
        # echo "tableNumber$c"

    done
else
  echo "only one table made named $table" # if only one table print this name to console
fi
# part of if null=========================
fi
#end of logicTest
}
```
