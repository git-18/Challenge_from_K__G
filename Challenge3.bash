Challenge #3

We have a nested object, we would like a function that you pass in the object and a key and get back the value. How this is implemented is up to you.
Example Inputs
object = {“a”:{“b”:{“c”:”d”}}}
key = a/b/c
object = {“x”:{“y”:{“z”:”a”}}}
key = x/y/z
value = a
Hints:
We would like to see some tests. A quick read to help you along the way
We would expect it in any other language apart from elixir.
A quick read to help you along the way 

#########################################################################################

Logic applied in the below code:
        if, the key contains  first 3 characters of the alphabet then 
            parse the characters in the object and choose the first alphabet character from the object, and print that as value.
        else if, the key contains the last 3 characters of the alphabet then
            parse the characters in the object and choose the last alphabet character from the object, and print that as value.

    note: the code to validate if the user has provided valid number of input parameters is not  added and can be added easily.


#########################################################################################
#!/bin/bash
read -p "please enter the object value and key value( separated by space): " object key
#newobject=`echo $object | sed -e 's/\(.\)/\1\n/g' | tr '\n' ' '`
newkey=`echo $key | sed 's#/# #g' | awk '{print $1,$2,$3}'`
#echo $key2 | awk -F/ '{print $1,$2,$3}'
alphabet="a b c d e f g h i j k l m n o p q r s t u v w x y z"
startingAlphabet=`echo $alphabet | awk '{print $1,$2,$3}'`
endingAlphabet=`echo $alphabet | awk '{print $24,$25,$26}'`
if [ "$newkey" = "$startingAlphabet" ]; then
    #Adding space to the objects
    newobject=`echo $object | sed 's/./& /g' `
    #print the first alphabet character by parsing the object.
    for i in $(echo $newobject); do
        if echo $alphabet | grep -w -q $i ; then
            #echo "character matched"
            echo "value=$i"
            break
        else
            echo "character not matched"
        fi
     done
elif [ "$newkey" = "$endingAlphabet" ]; then
    #Reversing the object characters and add spaces between them
    reverseobject=`echo {“a”:{“b”:{“c”:”d”}}} | sed 's/./&\n/g' | tac | sed -e :a -e 'N;s/\n//g;ta' | sed 's/./& /g'`
    #print the last alphabet character by parsing the object.
    for i in $(echo $reverseobject); do
        if echo $alphabet | grep -w -q $i ; then
            #echo "character matched"
            echo "value=$i"
            break
        else
            echo "character not matched"
        fi
     done
fi 
#########################################################
#echo welcome | sed 's/./&\n/g' | tac | sed -e :a -e 'N;s/\n//g;ta'
#echo {“a”:{“b”:{“c”:”d”}}} | sed 's/./&\n/g' | tac | sed -e :a -e 'N;s/\n//g;ta' this will reverse the string
#sed 's/./& /g'  add space between every letter of the word.
# echo {“a”:{“b”:{“c”:”d”}}} | sed 's/./& /g'   this will add spaces
# echo {“a”:{“b”:{“c”:”d”}}} | sed 's/./&\n/g' | tac | sed -e :a -e 'N;s/\n//g;ta' | sed 's/./& /g'   reverse and  space.