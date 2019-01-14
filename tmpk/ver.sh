#!/bin/bash

# this section will change as apps are updated
# modify the output of 'git status' to format below 
#cp ../BroWeb/arm64_SystemWebView.apk .
cp ../GmsCore/GmsCore.apk .
cp ../Phonesky/Phonesky.apk .


for i in *.apk; do
    unzip "${i}" 'AndroidManifest.xml' -d "${i%%.apk}"                                     #partial unzip for androidmanifest
    java -jar ~/jre/AXMLPrinter2.jar "${i%%.apk}"/AndroidManifest.xml > "${i%%.apk}".xml   #binary -> readable androidmanifest
    echo | sed -n -e 's/^.*\(android:versionName=\)//p' "${i%%.apk}".xml                   #parse version from readable
    #echo | awk '/android:versionName=/ {print $0}' < "${i%%.apk}".xml
    rm -rf "${i%%.apk}".xml "${i%%.apk}" "${i}"                                            #remove .apk, folder, readable
done
