#!/bin/bash
if [ -z $SecretFilename ]
then
  echo "Error: Must set target filename variable \$SecretFilename"
else
	export tempfilename=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 10)
	echo $VCAP_SERVICES | jq -r  .credhub[0].credentials.secretfile > /tmp/$tempfilename
	base64 -d /tmp/$tempfilename > $SecretFilename
        rm /tmp/$tempfilename
fi
