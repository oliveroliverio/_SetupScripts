homeDir=$(pwd)

# create home dir variable
create_home_dir_var(){
  cd $homeDir
  # get filename of setup sh script and name directory
  name="$(ls | grep *.sh)"
  # cut off the extension
  name=`echo "$name" | cut -d'.' -f1`

  mkdir $name && cd "$_"
  # call this the new homeDir
  homeDir=$(pwd)
}

create_home_dir_var

#-------------------------------------------------------------------------------------------
#-------fucntions: create readme and md files---------------------
#-------------------------------------------------------------------------------------------

create_MD_README(){
  cd $homeDir
  cat <<\EOF_MD >> README.md
# Create Requirements files

```
flask
TA-Lib
pandas
yfinance
```
EOF_MD
}

create_reqs_file(){
  cd $homeDir
  cat <<\EOF_ReqsFile >> requirements.txt
flask
TA-Lib
pandas
yfinance
EOF_ReqsFile
}


main(){
  create_reqs_file "yes"
  cd $homeDir
  # pip3 install -r requirememnts.txt
  create_MD_README
}

main