#!/bin/bash

#Expect 'profile' file in current director, temporary renames to .profile before injecting to target application jar

export appJarFilePath="./target/SecretsFileInjectorDemo-0.0.1-SNAPSHOT.jar"

cp ./profile ./.profile
jar uvf $appJarFilePath ./.profile
rm ./.profile
