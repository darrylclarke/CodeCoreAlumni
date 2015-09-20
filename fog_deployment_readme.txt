
FOG is currently configured for Google Cloud.
It is disabled by default, since I don't know how I'm going to share credentials.
NOTES:
config/local_env.yml defines a FOG_CREDENTIAL environment variable.
The value of FOG_CREDENTIAL is the name of the credential set in ~/.fog
  (in case you have multiple credentials for different projects)

Steps to enable fog:
1) In config/initializers/, copy setup_fog.rb.example to setup_fog.rb
2) In setup_fog.rb, enter the correct credentials into the fields
3) In app/uploaders, each uploader.rb file needs to be modified.
   Comment out the 'storage :file'
   Uncomment the 'storage :fog'
--------blah_uploader.rb
  # Choose what kind of storage to use for this uploader:
  #storage :file
  storage :fog
--------END blah_uploader.rb
4) Finally, you need the credentials in ~/.fog. Only the administrator currently has this.

  
  
 
  
  

