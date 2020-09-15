#!/bin/bash

set -eo pipefail

xcodebuild -workspace Jet2TravelTechnoloigesAssigment.xcworkspace \
            -scheme Jet2TravelTechnoloigesAssigment \ iOS \
            -sdk iphoneos \
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/Jet2TravelTechnoloigesAssigment.xcarchive \
            clean archive | xcpretty
