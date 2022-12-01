#import the files 
source color.sh

#welcome heading
flag=0
	echo -e "\n$green$bold                   👉️  Welcome to SIGN-IN  👈️                             $normal"
	echo -e "$blue$bold                      Test Your Knowledge                                 $normal"
        echo -e "$green                                                                          $normal"
        echo -e "$green                                                                          $normal"

#prompt the user for the email-id if existing user
echo -en "[E-mail]:"
read sign_in_email

#prompt the user for password for the existing account
echo -en "[Password]:"
read -s sign_in_password

        echo -e "\n$green                                                                          $normal"
        echo -e "$green                                                                          $normal"
#if the input is blank then Thrown an error asking the user to pass an valid entry 
if [[ $sign_in_email =~  ^[[:punct:][:alnum:]]+$  ]]
then

#accessing the user_database file for validating the user
	user_database=('cat user_database.csv')
	user_database_line_count=(`cat user_database.csv | wc -l`)
	password_field=(`cat user_database.csv | cut -d ';' -f 2`)
	email_id_field=(`cat user_database.csv | cut -d ';' -f 3`)
	mobile_number_field=(`cat user_database.csv | cut -d ';' -f 4`)
	dob_field=(`cat user_database.csv | cut -d ';' -f 5`)
	place_field=(`cat user_database.csv | cut -d ';' -f 6`)
	user_name_database=(`cat user_database.csv | cut -d ';' -f 1`)
	echo ${user_name_from_database[@]}

#validating the email-id and password from the "sign_in" user with the existing "user_database.csv"
	for((i=0; i<$user_database_line_count; i++))
	do
		if [ ${email_id_field[i]} == $sign_in_email -a   ${password_field[i]}  == $sign_in_password   ]
		then	
			flag=0; index=$i
			echo  "index:$index"
			break
		else
			flag=1
		fi
	done



#does goes to the test_screen if user is logged in sccessfully else prints the error
	if [ $flag -eq 0 ]
	then
		clear
		bash profile_page.sh  ${user_name_database[$index]}  ${email_id_field[$index]} ${mobile_number_field[$index]} ${dob_field[$index]} ${place_field[$index]} $index

	else
		clear
		echo -e "\n$red$bold[ERROR]$normal Oops!! Incorrect Sign-In Details $red$bold[ERROR]$normal "
		echo -e "Existing User$bold[sign-in]$normal\tNew User$bold[sign-up]$normal"
		bash index_page.sh
	fi

else
	clear
	echo -e "\n$red[ERROR]$normal Enter input to login $red[ERROR]$normal"
fi
