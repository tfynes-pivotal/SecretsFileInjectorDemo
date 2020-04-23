#!/bin/bash

# Filename holding secret
export secretFilename="secret.file"

# credhub service instance name 
export serviceEnvName="mysecretfile"


# credhub secret keyname hardcoded to 'secretfile' - used by the profile script to initialize secret-file in container

export uueExtension=".uue"
export tempFilename=$secretFilename$uueExtension

#base64 encode secret file
base64 ./$secretFilename > ./$tempFilename

#Register/Update secret in Credhub Service Instance
	# service does not exist - create service
	if [[ $(cf service $serviceEnvName 2>&1 | grep FAILED) != "" ]]
	then
 	echo service does not exist, creating service
	 cf create-service credhub default $serviceEnvName -c '{ "secretfile": '"\"$(cat ./secret.file.uue)\""' }'
	else
	 echo service exists, updating service
	 cf update-service $serviceEnvName -c '{ "secretfile": '"\"$(cat ./secret.file.uue)\""' }'
	fi

rm ./$tempFilename
