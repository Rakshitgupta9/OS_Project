#!/bin/bash
source color.sh

#interpreters only if 6 arguments are passes which carries the user-info
if [ $# -eq 6 ]
then
	   
#page-layout
           echo -e "$bold$blue                              Profile                                     $normal"
           echo -e "$green                                                                          $normal"
	   echo -en "[Name]:$1"
	   echo -en "\n[E-mail-ID]:$2"
	   echo -en "\n[Mobile-No]:$3"
	   echo -en "\n[DOB]:$4"
	   echo -en "\n[Place]:$5"
	   echo -e "\n$green                                                                          $normal"
           echo -e "$green                                                                          $normal"
           echo -e "$green$bold   *Enter [T] to take the Test                                            $normal"
           echo -e "$green$bold   *Enter [E] to Edit Profile Details                                     $normal"
	   echo -e "$green$bold   *Enter [L] to Log-Out                                                  $normal"
           echo -e "$green                                                                          $normal"
	   echo -en "$bold[Enter your Choice]$normal:"
 	   read user_input

#validates the user_input
	case $user_input in

	"T")	clear
		bash test_screen.sh $1 $2 $3 $4 $5 $6	;;
	"E")    clear
		bash edit_page.sh $1  $2 $3 $4 $5 $6;;
	"L")    clear
		bash index_page.sh ;;
	*)	clear
		echo  -e "\n$red[ERROR]$normal INVALID INPUT $red[ERROR]$normal"
		bash profile_page.sh $1 $2 $3 $4 $5 $6;;
	esac

else 
	clear
	echo -e "\n$red[ERROR]$normal Sign-in or Log-in $red[ERROR]$normal\n"
	bash index_page.sh
fi
