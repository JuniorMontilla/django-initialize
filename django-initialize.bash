#!bin/bash
#by Junior Montilla

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
mkdir  $HOME/.django-templates/
cd $HOME/git/django/$projectname/

echo 
echo "* Initialize virtualenv environment. *"
echo 

sleep 3
virtualenv .env
source .env/bin/activate

echo 
echo "* Installing django and starting project *"
echo 

if [ $djversion == "1.4" ];then
        pip install django==1.4.5
	django-admin.py startproject --template=file://$HOME/.django-templates/django-1.4-conf-templates.zip $projectname
fi	

cd  $projectname/

echo
echo "* initialize project as git repo *"
echo
wget  -q https://s3-us-west-2.amazonaws.com/conf.django-initialize/.gitignore
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
