#! /bin/bash

clear

apppath=$1
plataformpath=$2
appname=$3

rm -r "$apppath/standalone/"
rm -r "$apppath/build/"

$plataformpath/../../opt/python/bin/pyrun2.7 $apppath/generate.py build

mkdir $apppath/standalone
mkdir $apppath/standalone/$appname
mv $apppath/build $apppath/standalone/$appname/src/

cp -r $plataformpath/../../knl/xulrunner $apppath/standalone/$appname/xulrunner/
rm $apppath/standalone/$appname/xulrunner/crashreporter
rm $apppath/standalone/$appname/xulrunner/plugin-container
rm $apppath/standalone/$appname/xulrunner/updater

cd $apppath/standalone/$appname/src/script/
for i in $(ls)
do
$plataformpath/../../opt/jre/bin/java -jar "$plataformpath/../../opt/yuicompressor/yuicompressor-2.4.2.jar" --type js -o $apppath/standalone/$appname/src/script/$i $apppath/standalone/$appname/src/script/$i
done

cp $apppath/etc/boot/bootstrap.package.js $apppath/standalone/$appname/bootstrap.js
cd $apppath/standalone/$appname
zip -r ../$appname.zip *
echo Package created at $apppath/standalone/$appname.zip
