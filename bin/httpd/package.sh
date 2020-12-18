#! /bin/bash

clear

apppath=$1
plataformpath=$2
appname=$3

#cd $apppath
rm -r "$apppath/standalone/"
rm -r "$apppath/build/"

$plataformpath/../../opt/python/bin/pyrun2.7 $apppath/generate.py build

mkdir $apppath/standalone
mkdir $apppath/standalone/$appname
mv $apppath/build $apppath/standalone/$appname/src/

mv $apppath/standalone/$appname/src/script/$appname.js $apppath/standalone/$appname/src/script/index.sjs

cp -r $plataformpath/../../knl/xulrunner $apppath/standalone/$appname/xulrunner/
rm $apppath/standalone/$appname/xulrunner/crashreporter
rm $apppath/standalone/$appname/xulrunner/plugin-container
rm $apppath/standalone/$appname/xulrunner/updater

cp -r $plataformpath/../../knl/webserver $apppath/standalone/$appname/webserver/

cd $apppath/standalone/$appname/src/script/
for i in $(ls)
do
$plataformpath/../../opt/jre/bin/java -jar "$plataformpath/../../opt/yuicompressor/yuicompressor-2.4.2.jar" --type js -o $apppath/standalone/$appname/src/script/$i $apppath/standalone/$appname/src/script/$i
done

cp $apppath/etc/boot/bootstrap.package.js $apppath/standalone/$appname/bootstrap.js
cp $plataformpath/../../etc/run.sh $apppath/standalone/$appname/run.sh
cp $apppath/etc/bootload.json $apppath/standalone/$appname/src/bootload.json
cd $apppath/standalone/$appname
zip -r ../$appname.zip *
echo Package created at $apppath/standalone/$appname.zip
