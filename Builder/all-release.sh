#!/usr/bin/env bash
JAVA_HOME=/home/dev/Downloads/AndroidStudio/android-studio-2022.2.1.18-linux/android-studio/jbr/

./fonts.sh

./link_to_mupdf_1.22.0.sh

cd ../

./gradlew clean incVersion

./gradlew assembleLibreraRelease
./gradlew assemblePdf_v2Release
./gradlew assembleEbookaRelease
./gradlew assemblePdf_classicRelease
./gradlew assembleFdroidRelease
./gradlew assembleTts_readerRelease
./gradlew assembleEpub_readerRelease

cd Builder
link_to_mupdf_1.11.sh

cd ../

./gradlew assembleTts_readerRelease
./gradlew assembleEpub_readerRelease

./gradlew copyApks -Pbeta -Prelesae
./gradlew -stop

#rm /home/dev/Dropbox/FREE_PDF_APK/testing/*-x86*
#rm /home/dev/Nextcloud/LibreraBeta/*-x86*

cd Builder
./remove_all.sh
./install_all.sh
