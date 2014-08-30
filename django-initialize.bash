#!bin/bash
#by Junior Montilla

clear
echo "=============================="
echo "= Initialize django project. ="
echo "=============================="
sleep 3
echo "Project name?"
read projectname
echo "django version?"
read djversion
mkdir $HOME/git/django/$projectname
cd $HOME/git/django/$projectname/
echo "======================================"
echo "= Initialize virtualenv environment. ="
echo "======================================"
sleep 3
virtualenv .env
source .env/bin/activate
echo "================================="
echo "= Installing django==$djversion ="
echo "================================="
if [ $djversion == "1.7" ]; 
    then
	pip install https://www.djangoproject.com/download/1.7c3/tarball/
else
    pip install django==$djversion
fi
django-admin.py startproject $projectname
cd $projectname/$projectname
mkdir  static/ media/ apps/ templates/ apis/
touch static/__init__.py media/__init__.py  apps/__init__.py templates/__init__.py  apis/__init__.py
echo "{$projectname, DONE}."
