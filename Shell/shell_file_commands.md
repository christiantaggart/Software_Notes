# Shell File Commands

- lists your files
```bash
ls                         
```

- lists your files in 'long format', (exact size of the file,  owner, who has the right to read, and when it was last modified
```bash
ls -l    
```                 
- lists all files, including hidden files
```bash
ls -a               
```
- creates symbolic link to file
```bash
ln -s <filename> <link>     
```
- creates or updates your file
```bash
touch <filename>          
```
- places standard input into file
```bash
cat > <filename>           
```
- shows the first part of a file (move with space and type q to quit)
```bash
more <filename>      
```
- outputs the first 10 lines of file
```bash
head <filename>             
```
- outputs the last 10 lines of file (useful with -f option)
```bash
tail <filename>             
```
- lets you create and edit a file
```bash
emacs <filename>            
```
- moves a file
```bash
mv <filename1> <filename2>  
```
- copies a file
```bash
cp <filename1> <filename2>  
```
- removes a file
```bash
rm <filename>               
```
- compares files, and shows where they differ
```bash
diff <filename1> <filename2>
```
- tells you how many lines, words and characters there are in a file
```bash
wc <filename>               
```
- lets you change the read, write, and execute permissions on your files
```bash
chmod -options <filename>   
```
- looks for the string in the files
```bash
grep <pattern> <filenames>  
```
- search recursively for pattern in directory
```bash
grep -r <pattern> <dir>     
```
