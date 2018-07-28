# clones a branch of local git repo to a temporary folder
# useful for a running a build on a different branch 
# without interrupting your current workflow

temp=$(mktemp -d)

# $1 the branch to be cloned - provided via user input
# $PWD from the current directory
# clone into the recently declared temp folder
git clone branch $1 $PWD $temp 
echo "branch $1 cloned to $temp"

# run some tasks, test, etc