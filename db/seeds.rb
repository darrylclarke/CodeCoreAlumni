# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   
# Make the ADMIN acct
  first_name  = "admin"
  last_name   = "admin"
  email       = "admin@codecore.ca"
  password    = "admin"
  is_active   = true
  is_admin    = true 
  User.create(
    first_name: first_name,
    last_name: last_name,
    email:      email,
    password:   password,
    is_active:  is_active,
    is_admin:   is_admin
  );
NUM_ACTIVE_USERS = 25
NUM_ACTIVE_USERS.times do
  first_name  = Faker::Name.first_name
  last_name   = Faker::Name.last_name
  email       = first_name + "@codecore.ca"
  password    = first_name
  is_active   = true
  is_admin    = false
  User.create(
    first_name: first_name,
    last_name: last_name,
    email:      email,
    password:   password,
    is_active:  is_active,
    is_admin:   is_admin
  );
end
NUM_INACTIVE_USERS = 5
NUM_INACTIVE_USERS.times do
  first_name  = Faker::Name.first_name
  last_name   = Faker::Name.last_name
  email       = Faker::Internet.email
  password    = first_name
  is_active   = false 
  is_admin    = false
  User.create(
    first_name: first_name,
    last_name: last_name,
    email:      email,
    password:   password,
    is_active:  is_active,
    is_admin:   is_admin
  );
end
NUM_EXPERIENCES = 50
NUM_EXPERIENCES.times do
  # Experiences
  exp_job_title = Faker::Name.title
  exp_company   = Faker::Company.name
  exp_company_url = Faker::Internet.url
  exp_description = Faker::Hacker.say_something_smart
  exp_start_date = Time.now - (rand(20)).years
  exp_end_date = Time.now - (rand(4)).years
  exp_presently_working = [true, false, false, false].sample
# JEFF NOTE: This is a hardcoding for quick seed
  exp_user_id = [1,2,3,4,5].sample
  Experience.create(
      job_title: exp_job_title,
      company: exp_company,
      company_url: exp_company_url,
      description: exp_description,
      start_date: exp_start_date,
      end_date: exp_end_date,
      presently_working: exp_presently_working,
      user_id: exp_user_id
  );
end

