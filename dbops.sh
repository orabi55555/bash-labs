
function authenticate {
	echo "Authentication.."
}

function querystudent {
	echo "Now query"
	echo -n "Enter student name to query GPA : "
	read NAME
	##We want to get line from datafile starts with NAME followed by :
	LINE=$(grep "^${NAME}:" datafile)
	if [ -z ${LINE} ]
	then
		echo "Error, student name ${NAME} not found"
	else
		GPA=$(echo ${LINE} | awk ' BEGIN { FS=":" } { print $2 } ')
		echo "GPA for ${NAME} is ${GPA}"
	fi
}

function insertstudent {
	echo "Inserting a new student"
	echo -n "Enter name : " 
	read NAME
	echo -n "Enter GPA : "
	read GPA
	### Before adding, we want to check GPA valid floating point or no
	if ! checkFloatPoint "$GPA"; then
		echo "Error: GPA must be float"
	return 1
	fi
	echo "${NAME}:${GPA}" >> datafile
}

function deletestudent {
	echo "Deleting an existing student"
	echo -n "Enter studen to delete : "
	read NAME
	##We want to get line from datafile starts with NAME followed by :
        LINE=$(grep "^${NAME}:" datafile)
        if [ -z ${LINE} ]
        then
                echo "Error, student name ${NAME} not found"
        else
		##Before delete, print confirmation message to delete or no
		echo  "Are you sure you want to delete ${NAME}? (yes/no)"
		read CONFIRM
		if [ "$CONFIRM" = "yes" ]; then
			##-v used to get lines DOES NOT contain regex
			grep -v "^${NAME}:" datafile > /tmp/datafile
			cp /tmp/datafile datafile
			rm /tmp/datafile
			echo "Deleted Successfully"
		else
			echo "Cancelled"
		fi
        fi
}

function updatestudent {
echo "Updating an existing student's grade"
  echo -n "Enter student name: "
  read NAME
  
 ## get line from datafile starts with NAME followed by :
  LINE=$(grep "^${NAME}:" datafile)
  
  if [ -z ${LINE} ]
  then
    echo "Error, student name ${NAME} not found"
  else
  #ask for new grade and update it
    echo -n "Enter new grade: "
    read NEWGRADE
    sed -i "s/^${NAME}:${GRADE}/${NAME}:${NEWGRADE}/" datafile
    echo "Grade updated successfully"
fi  
}
