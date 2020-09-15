#!/bin/bash

set -eo pipefail

xcodebuild -archivePath $PWD/build/Jet2TravelTechnoloigesAssigment.xcarchive \
            -exportOptionsPlist Jet2TravelTechnoloigesAssigment/Jet2TravelTechnoloigesAssigment\ iOS/exportOptions.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty
