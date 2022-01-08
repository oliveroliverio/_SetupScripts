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

create_app_py(){
  cd $homeDir
  cat <<\EOF_appfile >> app.py
from flask imnport Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
  return render_template('index.html')

@app.route('/snapshot')
def snapshot():
  return {
    'code': 'success'
  }

EOF_appfile
}

create_index_file(){
  cd $homeDir
  mkdir templates && cd "$_"
  cat <<\EOF_indexHTML >> index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

</body>
</html>
EOF_indexHTML
}


main(){
  create_reqs_file "yes"
  cd $homeDir
  # pip3 install -r requirememnts.txt
  create_MD_README
  create_reqs_file
  create_index_file
}

main