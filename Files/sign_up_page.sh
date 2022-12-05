#!/bin/bash
#imports the required files 
source color.sh



#screen head
 echo -e "\n$green$bold                    👉️  Welcome to SIGN-UP  👈️                            $normal"
 echo -e "$blue$bold                       Test Your Knowledge                                $normal"
 echo -e "$green                                                                          $normal"
 echo -e "$green                                                                          $normal"






#prompt the user for user_name
echo -ne  "[Name]:"
read user_name_from_user
if [ $user_name_from_user ]
then
#gets the existing user from the user_database
flag=1
user_name_from_database=(`cat user_database.csv | cut -d ';' -f 1`)
line_count_from_database=(`cat user_database.csv | wc -l `)

#check if the user-name is present in the database
for((i=0; i<$line_count_from_database; i++))
do

if [ ${user_name_from_database[i]} == $user_name_from_user  ]
then
	flag=0	
	break
fi
done

#validates the user_name 
if [[  $flag -eq 1 ]]
then
	user_name=$user_name_from_user
	echo -n "[Password]:"
	read -s  user_password

#validates the password for 8 - alpha numeric character or thrown an error
	if [ ${#user_password} -gt 8 ]
	then
		if [[ $user_password =~  [a-zA-Z]*..*[0-9]+[a-zA-Z]*   ]] 
		then
			echo -en "\n[Confirm Password]:"
			read -s  re_user_password

#validates the password and the confirm password or thrown an error
			if [  $user_password == $re_user_password  ] 
			then
				echo -en "\n[Email-Id]:" 
				read email_id

#validates the email-id with "@ ." or throw an error
				if [[ $email_id =~ .@.*\.[a-z]+   ]]
				then
		
					echo -n "[Mobile-No]:"
					echo -n "+91-"; read mobile_no

#validates the modile-number for 10-digits or throw an error
					if [[ $mobile_no =~ ^[0-9]{10}$  ]]
					then
						echo -n "[DOB(dd/mm/yyyy)]:"
						read DOB
#validates the Date of Birth of the User else throw an error
						if [[ $DOB =~ ^[0-3][0-9]/[0-1][0-9]/[0-9]{4}$  ]]
						then
							echo -n "[Place]:"
							read place
						else
							clear
							echo -e "$red[ERROR]$normal Invalid Date try again with \"dd/mm/yyyy\" $red[ERROR]$noraml"
							bash sign_up_page.sh
						fi
					else
						clear	
						echo -e "\n$red[ERROR]$normal Enter the valid Phone-Number $red[ERROR]$normal\n"
						bash sign_up_page.sh			
					fi	


				else
					clear	
					echo -e "\n$red[ERROR]$normal Enter the valid email-id $red[ERROR]$normal\n"
					bash sign_up_page.sh
				fi
			else
				clear
				echo -e "\n$red[ERROR]$normal Mismatching Password $red[ERROR]$normal\n\n"
				bash sign_up_page.sh
			fi
	
		else
			clear
			echo -e "\n$red[ERROR]$normal Password Should have atleast 8-alphaNumberic Charcters $red[ERROR]$normal\n\n"
			bash sign_up_page.sh
		fi

	else
		clear
		echo -e "\n$red[ERROR]$normal Password Should be atleast 8 alpha-numeric characters $red[ERROR]$normal\n"
		bash sign_up_page.sh
	fi
		

else
	clear
	echo -e "\n$red[ERROR]$normal User-Name  is Already Present $red[ERROR]$normal\n"
	bash sign_up_page.sh
fi

else
	clear
	echo -e "\n$red[ERROR]$normal Please Enter the user_name $red[ERROR]$normal\n"
	bash sign_up_page.sh
fi

#passes all the fields to user_database.csv file
echo "$user_name;$user_password;$email_id;$mobile_no;$DOB;$place;" >> user_database.csv  
clear
bash index_page.sh
