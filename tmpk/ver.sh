#!/bin/bash

# this section will change as apps are updated
# modify the output of 'git status' to format below
cp ../BroWeb/arm64_SystemWebView.apk .
cp ../GmsCore/GmsCore.apk .
cp ../Phonesky/Phonesky.apk .
#cp ../FDroid/FDroid.apk .

for i in *.apk; do
    unzip -q "${i}" 'AndroidManifest.xml' -d "${i%%.apk}"                                     #partial unzip for androidmanifest
    java -jar ~/jre/AXMLPrinter2.jar "${i%%.apk}"/AndroidManifest.xml > "${i%%.apk}".xml      #binary -> readable androidmanifest
    echo "${i%%.apk} -> `sed -n -e 's/^.*\(android:versionName=\)//p' "${i%%.apk}".xml`"      #parse version from readable
    rm -rf "${i%%.apk}".xml "${i%%.apk}" "${i}"                                               #remove .apk, folder, readable
done
