##2-

### Module contains all validation functions

## Function accepts a file name, and return 0 if exists, 1 not exists
function checkFile {
	FILENAME=${1}
	if [ -f ${FILENAME} ]
	then
		return 0
	else
		return 1
	fi
}

## Function accepts a file name, and return 0 if has r perm, 1 not 
function checkRFile {
        FILENAME=${1}
        if [ -r ${FILENAME} ]
        then
                return 0
        else
                return 1
        fi
}

## Function accepts a file name, and return 0 if has write, 1 not exists
function checkWFile {
        FILENAME=${1}
        if [ -w ${FILENAME} ]
        then
                return 0
        else
                return 1
        fi
}


##Functionm accepts a value, return 0 if valid positive integer, 1 not
function checkInteger {
	VAL=${1}
	if [ $(echo ${VAL} | grep -c "^[0-9]*$") -eq 1 ]
	then
		return 0
	else
		return 1
	fi
}

##Functionm accepts a value, return 0 if valid negative integer, 1 not
function checkNInteger {
        VAL=${1}
        if [ $(echo ${VAL} | grep -c "^\-\{0,1\}[0-9]*$") -eq 1 ]
        then
                return 0
        else
                return 1
        fi
}

##Function accept value, return 0 if valud floating pointm 1 not
function checkFloatPoint {
        VAL=${1}
        if [ $(echo ${VAL} | grep -c "^\-\{0,1\}[0-9]*$") -eq 0 ]
        then
                return 0
        else
                return 1
        fi

}

##Functionm accepts a value, return 0 if valid email address, 1 not
function checkEMail {
  VAL=${1}
  if [[ "$VAL" =~ "^(([A-Za-z0-9]+((\.|\-|\_|\+)?[A-Za-z0-9]?)[A-Za-z0-9]+)|[A-Za-z0-9]+)@(([A-Za-z0-9]+)+((\.|\-|\_)?([A-Za-z0-9]+)+))+\.([A-Za-z]{2,})+$"  ]]; then
	return 0
  else
    	return 1
  fi
}






