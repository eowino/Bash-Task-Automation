# Useful bash commands

`cat -n file.txt` - to view a file with line numbers.

`open file.txt -a "google chrome"` - to open a file with a specific application. If no args, the file will be opened with the default
program associated with that file type. This is useful when you want to open a file that isn't associated with any program.

`mkdir -p a/b/c` - to create intermediary directories if they don't exist.

`cp -R src/ lib/` - to recursively copy a folder and its subfolders from one directory to another.

`find src/ -name "*.html"` - to find all files where the name ends in `.html`. You can also use the `-iname` for a case-insensitive search.

`find . -type d` - to find all directories in the current directory. Add `-name fonts` to find all folders named 'fonts'.

`find dist/ -name "*.dist.js" -delete` - the `find` command also supports performing actions on results. For example, to delete all files in a directory that end with 'dist.js', 
you may use.

`find /images -name "*.png" -exec pngquant {} \;` - to find .png files in an 'images' directory. 
- `-exec` - allows you to execute any command. 'pngquant' (an image compression and optimisation tool) in this instance.
- `{}` - represents each image throughout the process. 
- `\;` - closes the expression.

`grep "debugger" /dist/build.js` - to perform string matches on a given file. N.B. the output result is not an indication of whether
the matching texts are close to each other. 

- `grep "debugger" /src/**/*.js` - to search through multiple files 
- `--color -n` - flags to get coloured results with line numbers.
- `-C 5` - context flag to recieve context. This example will show you the previous, and next 5 lines of match.
- `-e` - the regex flag. E.g. `grep --color -n -e "[forEachmap]" src/js/` to search for occurrences of `map` or `forEach`.

`curl https://www.google.com/` - to perform an HTTP GET request and print results to stdout. N.B. `curl` by default doesn't follow re-directs
the same way a browser might.

- `-i` - include headers flag
- `-L` - To follow re-directs or add a trailing `/` to the URL
- `-o` - output the results to a file e.g. `curl -iL  https://www.google.com/ -o google.txt `
- `-H` - to pass headers e.g. `curl -H "Authorization: Bearer test" http://myapi/users`
- `-d` - request body
- `-X` - to change method type e.g. `curl -X POST -H "Content-Type: application/json" -d '{ "lang": "JS" }' http://myapi/user`
- `--data-urlencode` - to POST a url encoded form e.g. `curl -i -X POST --data-urlencode name=bob --data-urlencode title=mr http://myapi/user`
- use the backslash character to build headers in a REPL like manner
- `curl http://myapi/user | jsome` - to pipe the output of the request. 'jsome' here is used to pretty print the JSON response.

`chmod u+x script.sh` - add to the user (u) the permission to execute (x) a script 

`echo $PATH` - prints out a colon seperated list of folders where your shell looks for executables

`cp scaffold-js.sh /usr/local/bin/scaffold-js` - to make your script executable from an directory. Then do `which scaffold-js` to check to see it worked

`name=code` - to set a local variable in a bash session. N.B. by default, the variable is not visible to scripts executed in the context of the same shell.
- `export name` - to make the variable visible to child processes, commands, scripts, etc. executed in the context of the same shell
- `unset name` - to unset a variable

`env` - to see the global environment variables set by Bash.

`mktemp` - to make a temporary file.
- `-d` - to make a temporary folder

`echo $?` - to view the exit status. Will be an int between 0 and 255.

`curl -ILs https://google.com | head -n 1 | cut -d ' ' -f 2` - to get the status code of curl request
- GET request
- `head -n 1` - return first row
- `cut -d ' ' -f 2` - cut using delimeter and get the 2nd item in the list