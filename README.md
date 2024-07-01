
1. Download the Veridex code from Google's Official non-SDK interface page
https://developer.android.com/guide/app-compatibility/restrictions-non-sdk-interfaces

DIRECT DOWNLOAD LINK - LINUX
https://android.googlesource.com/platform/prebuilts/runtime/+archive/main/appcompat.tar.gz

2. Extract the downloaded Veridex archive to a local folder.

ie. if the user has name 'tom' and the archive has been downloaded to the 'Download' folder, the relative path will be 
~/runtime-refs_heads_main-appcompat

and the absolute path will be 
/home/tom/Downloads/runtime-refs_heads_main-appcompat

3. Edit the script to add the absolute path

Modify line number 8 with the absolute path
For example, change it from 

FOLDER_VERIDEX="{absolute_path_to_veridex_folder}"

to 

FOLDER_VERIDEX="/home/tom/Downloads/runtime-refs_heads_main-appcompat"

4. Download the restriction lists files from Google's Official non-SDK interface page

Version 12
https://dl.google.com/developers/android/sc/non-sdk/hiddenapi-flags.csv

Version 13
https://dl.google.com/developers/android/tm/non-sdk/hiddenapi-flags.csv

Version 14
https://dl.google.com/developers/android/udc/non-sdk/hiddenapi-flags.csv

Version 15
https://dl.google.com/developers/android/vic/non-sdk/hiddenapi-flags.csv

5. Place the downloaded file in the folder from where you are running the script.
hidden_flags="hiddenapi-flags.csv"

6. Run the shell script pointing it to the folder that contains the Android applications to test.
For example, if the applications to check have been downloaded into the folder "googleplay_2023",
the script should be executed in the following way

sh veridex_multi_parser.sh '/home/tom/Downloads/googleplay_2023'

