#!/bin/sh

# This script embeds (and codesigns) a framework within an iOS app binary, but only when the configuration is Debug.
# It must be called from, or copied into an Xcode Run Script build phase with following setup:
# Input Files:
#     - Path to framework within project folder (source path)
#     - For example: $(SRCROOT)/ThirdPartyFrameworks/SimulatorStatusMagiciOS.framework
# Output Files:
#     - Desired path to framework within ${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH} (destination path)
#     - For example: ${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/SimulatorStatusMagiciOS.framework
#
# For explanation of Input & Output Files, check out: https://indiestack.com/2014/12/speeding-up-custom-script-phases/
# This script adapted from: https://stackoverflow.com/a/40484337/9051514 (thanks Ricardo Duarte!)

if [[ -z ${SCRIPT_INPUT_FILE_0} || -z ${SCRIPT_OUTPUT_FILE_0} ]]; then
    echo "This Xcode Run Script build phase must be configured with Input & Output Files"
    exit 1
fi

echo "Embed ${SCRIPT_INPUT_FILE_0}"
if [[ $CONFIGURATION == 'Debug' ]]; then
    FRAMEWORK_SOURCE=${SCRIPT_INPUT_FILE_0}
    FRAMEWORK_DESTINATION=${SCRIPT_OUTPUT_FILE_0}
    DESTINATION_FOLDER=`dirname ${FRAMEWORK_DESTINATION}`
    
    mkdir -p ${DESTINATION_FOLDER}
    cp -Rv ${FRAMEWORK_SOURCE} ${FRAMEWORK_DESTINATION}

    CODE_SIGN_IDENTITY_FOR_ITEMS="${EXPANDED_CODE_SIGN_IDENTITY_NAME}"
    if [ "${CODE_SIGN_IDENTITY_FOR_ITEMS}" = "" ] ; then
        CODE_SIGN_IDENTITY_FOR_ITEMS="${CODE_SIGN_IDENTITY}"
    fi

    BINARY_NAME=`basename ${FRAMEWORK_DESTINATION} .framework`
    codesign --force --verbose --sign "${CODE_SIGN_IDENTITY_FOR_ITEMS}" ${FRAMEWORK_DESTINATION}/${BINARY_NAME}
    echo " ✅ Embedded successfully"
else
    echo " ❌ Non Debug build detected - do not embed"
fi
