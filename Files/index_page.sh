#!/bin/bash
source color.sh
            echo -e "$bold$blue                         Test Your Knowledge                              $normal"
            echo -e "$green                                                                          $normal"
            echo -e "$green                                                                          $normal"
	    echo -e  "$bold\n 1.Sign-In"
            echo    " 2.Sign-Up"
            echo -e " 3.Exit\n$normal"
	    echo -e "$green                                                                          $normal"
            echo -e "$green                                                                          $normal"
#prompts the user for the user-input
	    echo -en "$bold[Enter your Choice]:$normal"
	    read input_user_index
if [ $input_user_index ]
then

#validates the user_index_page input
	case $input_user_index in
	1)	clear
		bash sign_in_page.sh 	;;
	2) 	clear
		bash sign_up_page.sh	;;
	3) 	clear
	  	echo -e "\n\n\n\t\t\t\t**********\t$yellow This program has stopped executing as per your input $normal\t**********\t\t\t"
		sleep 2
		clear
		exit	;;
	*)	clear
		echo -en "\n\n$red[ERROR]$normal Invalid Option $red[ERROR]$normal\n\n"
		bash index_page.sh	;;
	esac

else
	clear
 	echo -en "\n$red[ERROR]$normal Please give an input $red[ERROR]$normal\n" 
	bash index_page.sh
fi
