# SecretsFileInjectorDemo
example of how to use credhub-service-broker and .profile script to secure and inject secrets files into TAS platform hosted applications


TanzuApplicationService parallel functionality to kubernetes secrets volume mounting but with a built-in platform encrypted vault (Credhub)


Abstract: Late-binding / injecting secrets is a much better pattern than compiling secrets into deployment-artifacts as part of a build process. 
Some applications however are not suited to reading these values from environment variables, instead expecting them 
in a local secrets file.


Demo Premise: 'secrets.file' is NOT pushed with the app but is required by the app to function properly.

Demo Solution: Store 'secrets.file' content in CredHub (base64 encoded) 
  and use an app profile script to auto-reconstruct the 'secrets.file' inside the running target container.
  
Demo Details / Script:

1. clone git repo
2. log into a TAS foundation with CredHub Service Broker available

3. compile demo application: mvn package

4. base64 encode and store in credhub the local 'secret.file' file content:  run 1-encodeAndStoreSecretFile.sh

5. inject credential-file-reconstructor script: add 'profile' script to target application jar (renamed to .profile) 

6. push application: run script 3-pushApp.sh - note the app manifest.yml binds the app to 'mysecretfile' service instance and set a SecretFilename env variable to the target location where secret file will be reconsructed.

7. make rest call to root context of demo application and observe in cf logs the app printing contents of file /home/vcap/secret.file


