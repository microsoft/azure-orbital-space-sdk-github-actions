#!/bin/bash
#
# Updates all critical @<current> references to @<target> in all yaml files.
#
# Example Usage:
#
#  "bash ./update-refs.sh --current main --target new-branch"


############################################################
# Script variables
############################################################
CURRENT_BRANCH="main"
TARGET_BRANCH=""

############################################################
# Help                                                     #
############################################################
function show_help() {
   # Display Help
   echo "Updates all critical @<current> references to @<target> in all yaml files."
   echo
   echo "Syntax: bash ./update-refs.sh --current main --target new-branch"
   echo "options:"
   echo "--current | -a                     [REQUIRED] current branch reference you wish to replace with target"
   echo "--target  | -d                     [REQUIRED] replacement branch reference"
   echo "--help | -h                        [OPTIONAL] Help script (this screen)"
   echo
   exit 1
}

############################################################
# Process the input options.
############################################################
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -c | --current)
            shift
            CURRENT_BRANCH="$1"
            ;;
        -t|--target)
            shift
            TARGET_BRANCH="$1"
        ;;
        -h|--help) show_help ;;
        *) echo "Unknown parameter '$1'"; show_help ;;
    esac
    shift
done



if [[ -z "$CURRENT_BRANCH" ]]; then
    echo "[${SCRIPT_NAME}] [ERROR] ${TIMESTAMP}: Mising --current parameter"
    show_help
fi

if [[ -z "$TARGET_BRANCH" ]]; then
    echo "[${SCRIPT_NAME}] [ERROR] ${TIMESTAMP}: Mising --target parameter"
    show_help
fi

function replace_references(){
    # Directory to search
    dir="."

    # Iterate over all .yaml files in the directory
    for file in $(find $dir -type f -name "*.yaml"); do
    # Skip the file named change-branch-refs.yaml
    if [[ $file == *"check-branch-refs.yaml"* ]]; then
        continue
    fi

    # Replace @${CURRENT_BRANCH} with @${TARGET_BRANCH}
    sed -i "s/@${CURRENT_BRANCH}/@${TARGET_BRANCH}/g" "$file"
    done

    echo "All @${CURRENT_BRANCH} references have been changed to @${TARGET_BRANCH} in .yaml files."
}

function main(){
    replace_references
}

main