# don't be tempted to pass args in function parens 
# its just an indication to bash that its a funtion

greet() {
    echo "Hello $1"
}

greeting=$(greet "world")
echo "the greeting is $greeting"

#############################################
# varialbe scope

global=123

test() {
    echo "global is: $global"
    local local_var="local here"
    echo "local variable: $local_var"
}

test

echo "global is: $global"
echo "local variable: $local_var"