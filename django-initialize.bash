#!bin/bash
#by Junior Montilla juniormontillaacosta[at]gmail[dot][com]

TEMPLATE14=$HOME/.django-templates/django-1.4-conf-templates.zip

reset

echo 
echo "* django-initialize. *"
echo
sleep 3

echo "Project name?"
read projectname
echo 
echo "Django version? (1.4, 1.5, 1.6)"
read djversion

mkdir -p $HOME/git/django/$projectname/
mkdir -p  $HOME/.django-templates/
if [ -e "$TEMPLATE14"  ];then       
    echo "The file exists."
else
    wget  -q --no-check-certificate https://s3-us-west-2.amazonaws.com/conf.django-initialize/django-templates/1.4/django-1.4-conf-templates.zip -O $TEMPLATE14
fi

cd $HOME/git/django/$projectname/

echo 
echo "* Initialize virtualenv environment. *"
echo 

sleep 3
virtualenv .env
source .env/bin/activate

echo 
echo "* Installing django *"
echo 

if [ $djversion == "1.4" ];then
        pip install django==1.4.5
	django-admin.py startproject --template=file://$TEMPLATE14 $projectname
fi	

cd  $projectname/

echo
echo "* initialize project as git repo *"
echo
wget  -q --no-check-certificate https://s3-us-west-2.amazonaws.com/conf.django-initialize/.gitignore
git init

echo 
echo "*  Installing libraries          *"
echo 
cat ./requirements.txt
echo
pip install -r  ./requirements.txt

echo 
echo "*   Running  syncdb command      *"
echo 
python manage.py syncdb

echo 
echo "*   Running the server            *"
echo 
python manage.py runserver  
