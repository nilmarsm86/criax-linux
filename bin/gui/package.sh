#! /bin/bash

clear

apppath=$1
plataformpath=$2
appname=$3

rm -r "$apppath/standalone/"
$plataformpath/../../opt/python/bin/pyrun2.7 $apppath/generate.py package
mkdir $apppath/standalone
$plataformpath/../../opt/python/bin/pyrun2.7 $plataformpath/../../knl/qooxdoo/tool/bin/create-application.py -n $appname -o $apppath/standalone -t website -p $plataformpath/../../etc/skeleton
mv $apppath/build/ $apppath/standalone/$appname/
cp -r $plataformpath/../../knl/xulrunner $apppath/standalone/$appname/xulrunner/
cp $plataformpath/../../etc/xulrunner-stub $apppath/standalone/$appname/$appname
mv $apppath/standalone/$appname/build $apppath/standalone/$appname/src/
rm $apppath/standalone/$appname/Gruntfile.js
rm $apppath/standalone/$appname/package.json
rm $apppath/standalone/$appname/generate.py
rm -r $apppath/standalone/$appname/script/
cp $apppath/etc/chrome.json $apppath/standalone/$appname/boot/chrome.json
cd $apppath/standalone/$appname/src/script/
for i in $(ls)
do
$plataformpath/../../opt/jre/bin/java -jar "$plataformpath/../../opt/yuicompressor/yuicompressor-2.4.2.jar" --type js -o $apppath/standalone/$appname/src/script/$i $apppath/standalone/$appname/src/script/$i
done
sed -i "4d" $apppath/standalone/$appname/src/index.html
cd $apppath/standalone/$appname
zip -r ../$appname.zip *
echo Package created at $apppath/standalone/$appname.zip
