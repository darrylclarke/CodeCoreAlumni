# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
NUM_ENTRIES = 50
NUM_ENTRIES.times do
  # Experiences
  exp_job_title = Faker::Name.title
  exp_company   = Faker::Company.name
  exp_company_url = Faker::Internet.url
  exp_description = Faker::Hacker.say_something_smart
  exp_start_date = Time.now - (rand(20)).years
  exp_end_date = Time.now - (rand(4)).years
  Experience.create(
      job_title: exp_job_title,
      company: exp_company,
      company_url: exp_company_url,
      description: exp_description,
      start_date: exp_start_date,
      end_date: exp_end_date,
  );
end

