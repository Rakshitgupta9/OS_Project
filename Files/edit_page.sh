#!/bin/bash

source color.sh

if [ $# -eq 6 ]
then

#This function prints the success message after the successful editing of the information 
function success_msg()
{
	    clear
            echo -e "$bold$blue                              Edit-Profile                                $normal"
            echo -e "$green                                                                          $normal"
            echo -e "$green                                                                          $normal"

	    echo -e "\n\t\t\t$blue$bold Successfully Edited $normal"

            echo -e "\n$green                                                                          $normal"
            echo -e "$green                                                                          $normal"
            echo -e "$green                                                                          $normal"
	    read n
	    clear
	    bash profile_page.sh  $1 $2 $3 $4 $5 $6


}


#index variable to access the values 
index=$((${6}+1))


#page layout
            echo -e "$bold$blue                              Edit-Profile                                $normal"
            echo -e "$green                                                                          $normal"
            echo -e  "$bold\t\t Enter The Option to edit $normal"
	    echo -en "1)Name:$1"
            echo -en "\n2)E-mail-ID:$2"
            echo -en "\n3)Mobile-No:$3"
            echo -en "\n4)DOB:$4"
            echo -en "\n5)Place:$5"              
            echo -e "\n$green                                                                          $normal"
            echo -e "$green                                                                          $normal"
            echo -e "$green                                                                          $normal"
            echo -en "$bold[Enter your Choice]$normal:"  
	    read user_input


#validates the user_input for appropriate value
case $user_input in

1)  	echo -en "$bold[Enter the New-Value]:$normal"
	read  new_entry
        user_name_database=(`cat user_database.csv | cut -d ';' -f 1`)
	sed  "${index}s/;/ /g" user_database.csv | sed "${index}s/${user_name_database[$index-1]}/$new_entry/g"  |sed "${index}s/ /;/g" > new1.txt && mv new1.txt user_database.csv
	success_msg	$1 $2 $3 $4 $5 $6	;;
	bash index_page.sh

2) 	echo -en  "$bold[Enter the New-Value]:$normal"
	read  new_entry
	email_id_field=(`cat user_database.csv | cut -d ';' -f 3`)
	sed  "${index}s/;/ /g" user_database.csv | sed "${index}s/${email_id_field[$index-1]}/$new_entry/g" |sed "${index}s/ /;/g">new1.txt && mv new1.txt user_database.csv
	success_msg	;;
	bash index_page.sh
	
3)  	echo -en "$bold[Enter the New-Value]:$normal"
	read  new_entry
	mobile_number_field=(`cat user_database.csv | cut -d ';' -f 4`)
	sed  "${index}s/;/ /g" user_database.csv | sed "${index}s/${mobile_number_field[$index-1]}/$new_entry/g"  |sed "${index}s/ /;/g">new1.txt && mv new1.txt user_database.csv
	success_msg	$1 $2 $3 $4 $5 $6	;;
	bash index_page.sh

4)  	echo -en "$bold[Enter the New-Value]:$normal"
	read  new_entry
	dob_field=(`cat user_database.csv | cut -d ';' -f 5`)
	sed  "${index}s/;/ /g" user_database.csv | sed "${index}s/${dob_field[$index-1]}/$new_entry/g"  |sed "${index}s/ /;/g">new1.txt && mv new1.txt user_database.csv
	success_msg	$1 $2 $3 $4 $5 $6	;;
	bash index_page.sh

5)	echo -en  "$bold[Enter the New-Value]:$normal"
	read  new_entry
	place_field=(`cat user_database.csv | cut -d ';' -f 6`)
	sed  "${index}s/;/ /g" user_database.csv | sed "${index}s/${place_field[$index-1]}/$new_entry/g"  |sed "${index}s/ /;/g">new1.txt && mv new1.txt user_database.csv
	success_msg	$1 $2 $3 $4 $5 $6	;;
	bash index_page.sh

*)	clear
 	echo -en "\n$red[ERROR]$normal INVALID CHOICE $red[ERROR]$normal\n" 
	bash edit_page.sh $1 $2 $3 $4 $5 $6 
esac

else
	echo -en "Sign-in or Sign-up to edit the information"
	bash index_page.sh
fi
