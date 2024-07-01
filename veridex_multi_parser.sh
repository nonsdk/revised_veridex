#!/bin/sh

# SET PATH TO FOLDER CONTAINING APKs TO PARSE
# [!] WARNING: FILES MUST END WITH EXTENSION NAME ".apk" (lowercase)
TARGET=$1

# SET PATH TO VERIDEX FOLDER
FOLDER_VERIDEX="{absolute_path_to_veridex_folder}"

# SET PATH TO non-SDK interface file downloaded from Google's page
hidden_flags="hiddenapi-flags.csv"

# RELATIVE PATH TO VERIDEX FOLDER
VERIDEX_TOOL=""$FOLDER_VERIDEX"/veridex-linux/appcompat.sh"

# RELATIVE PATH TO VERIDEX ORIGINAL FILE
VERIDEX_API=""$FOLDER_VERIDEX"/veridex-linux/hiddenapi-flags.csv"

# GET FOLDER BASENAME
RELDIR=$(basename "$TARGET")
LOGDIR="LOG__"$RELDIR""

# MAKE FOLDER IF MISSING
[ -d "$LOGDIR" ] || mkdir -p "$LOGDIR"

# ABS LOGDIR PATH
ABS_LOGDIR=$(realpath "$LOGDIR")

# FIND ALL APK FILES IN PATH
find "$TARGET" -name "*.apk" > "x_list.txt"

# FILE LIST
FLIST=$(realpath "x_list.txt")

# GET LOG DIRE ABSOLUTE PATH
LOGDIR=""$ABS_LOGDIR"/veridex_logs"

# MAKE VERIDEX PARSE USING ANDROID 14 CALLS
cat "$hidden_flags" | grep -v "max-target-s" > "$VERIDEX_API"

# CREATE VERIDEX LOG DIR IF MISSING
[ -d "$LOGDIR" ] || mkdir -p "$LOGDIR"
DLOGS=$(realpath "$LOGDIR")

# PARSE ALL APKs USING VERIDEX
while IFS= read -r line
do
    echo "PARSING FILE --> "$line""

    bname=$(basename "$line")

    logname=""$DLOGS"/"$bname"_veridex.txt"

    "$VERIDEX_TOOL" --dex-file="$line" > "$logname" 2>&1

done < "$FLIST"

# REMOVE TEMP FILE
rm -f "$FLIST"

exit