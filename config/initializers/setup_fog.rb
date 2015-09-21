CarrierWave.configure do |config|
   config.fog_credentials = {
     provider: 'Google',
     google_storage_access_key_id: "GOOGQQL2Y2VQKF2YJR75",
     google_storage_secret_access_key: "9Un5/uNcWloYo7mJkbhYBS8mDxiOP6IAmJ2S//Zv"
   }
  # This is the Google Storage bucket
  config.fog_directory  = 'codecore_alumni_bucket'                          # required
  config.fog_public     = false # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
