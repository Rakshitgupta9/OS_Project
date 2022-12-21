#!/bin/bash
#import the required files
source color.sh

function time1()
{

for((i=30; i>=1; i--))
do


	echo -ne " :$blue$bold[Enter your Option]$normal"
	echo -ne "                                $rg_green[$normal$bold$i$normal$rg_green]Seconds-Remaining$normal\033[0K\r"
	sleep 1

done


}



#This Fuction prints the test_result taken by the user
function test_result()
{




#imports the required files
 source color.sh
 
 
 
 #validates for user-info and user-score after the test is taken
 if [ $#  ]
 then
 
 #page-layout
         echo -e "\n$green$bold                     [Test-SuccessFully Completed]                        $normal"
         echo -e "$bold$blue                              Result                                      $normal"
         echo -e "$green                                                                          $normal"
         echo -en "$green                                                         $rg_red Welcome  $normal"
         echo -en "$bold $1$normal\n"
         echo -e "$green                                                                          $normal"
         echo -e "$green$bold   --> Your Total Score is: $7                                             $normal"         
         echo -e "$green                                                                          $normal"
         echo -e "$green                                                                          $normal"
         echo -e "$green                                                                          $normal"
         echo -e "$green$bold   *Enter [Y] to retake the Test                                          $normal"
         echo -e "$green$bold   *Enter [P] to go to Profile Page                                       $normal"
         echo -e "$green$bold   *Enter [V] to View The Test                                            $normal"
         echo -e "$green                       $normal$blue$bold Congratulations !!!$normal$green                               $normal"
         echo -e "$green                                                                          $normal"
 
 #prompts the user for the choice
         echo -ne "[Enter Your Option]:"
         read  user_input

#validate the user for the input
         case $user_input in
        
        "Y")    clear
                bash test.sh $1 $2 $3 $4 $5 $6;;
        "P")    clear
                bash profile_page.sh $1 $2 $3 $4 $5 $6;;
        "V")    clear
                view_test $1 $2 $3 $4 $5 $6;;
 
        *)      clear
                echo -e "\n$red[ERROR]$normal INVALID OPTION $red[ERROR]$normal\n\n" 
                test_result $1 $2 $3 $4 $5 $6 $7 ;;

        esac
else
        clear
        echo -e  "\n\n$bold Please Sign-in or Log-in to Take a Test $normal" 
        bash index_page.sh
 fi

}


#this function prints the question and user answer with the correct answers
function view_test()
{


for((i=0; i<10; i++))
do
	 clear
         echo -e "\n$blue$bold                             [View-Test]                                  $normal"
         echo -e "$green                                                                          $normal"
         echo -e "$green                                                                          $normal"
         echo -e "$green                                                                          $normal"
	 echo -e "\n$(($i+1)))${questions[i]}"
	 echo -e "\n$blue$bold    your Answer$normal: ${user_answer_for_rand[i]}"
	 echo -e "$green$bold correct Answer$normal: ${evaluation_sheet_for_rand[i]}\n"
	 echo -e "$green                                                                          $normal"
         echo -e "$green                                                                          $normal"
	read n
done

clear
bash profile_page.sh $1 $2 $3 $4 $5 $6


}


#validates if the user-info is present
if [ $1 ]
then

#access the  total-count-of-questions
	count_of_question=(`ls ./QUESTION_BANK | grep -i --regexp=.*\.txt | wc -l`)
	count=1
	total_marks=0

#random numbers are generated from the count of the questions (only ten questions are generated) and the correct answers are also accessed
	rand=(`shuf -i 1-$count_of_question -n  10`)
	evaluation_file=(`cat ./QUESTION_BANK/answer.csv`)
	evaluation_sheet=(` sed 's/;/ /g'   ./QUESTION_BANK/answer.csv `)

	for(( i=0; i<10; i++))
	do
#page-layout
		clear
		rearranged_evaluation_sheet=${evaluation_sheet[${rand[i]}-1]}	
          	echo -e "\n$blue$bold                             [ Test ]                                     $normal"
        	echo -e "$green                                                                          $normal"
          	echo -e "$green                                                                          $normal"
	  	echo -e ""
	  	echo -e "$count)`cat ./QUESTION_BANK/question${rand[i]}.txt`"
	  	echo -e ""
          	echo -e "$green                                                                          $normal"
          	echo -e "$green                                                                          $normal"
		count=$(($count+1))

		time1 &
		read -t 30   user_answer
#validates the user-input with the answer
		 if [ $user_answer ]
	 	 then
			kill $!
			clear
	 		if [ $user_answer == ${evaluation_sheet[${rand[i]}-1]} ]
	 		then
				total_marks=$(($total_marks+1))
		
	 	 	fi
	 	 fi

		questions[i]=`cat ./QUESTION_BANK/question${rand[i]}.txt`     
	        user_answer_for_rand[i]=$user_answer
	        evaluation_sheet_for_rand[i]=${evaluation_sheet[${rand[i]}-1]}
	done
	
	clear
	test_result $1 $2 $3 $4 $5 $6 $total_marks
#	bash  test_result.sh  $1 $2 $3 $4 $5 $6 $total_marks $questions $user_answer_for_randi $evaluation_sheet_for_randi

else
	clear
	echo -e "\n$red[ERROR]$normal Please Sign-in [Test-Software] $red[ERROR]$normal\n"
	bash index_page.sh
fi
