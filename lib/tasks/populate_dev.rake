# call with: rake db:populate_dev
# encoding: utf-8

namespace :db do
  desc "Populate the database with fake data for development"
  task :populate_dev => :environment do
    require 'faker'

    # Tags.delete_all
    # Taggings.delete_all

    # User.delete_all
    80.times do
      User.create do |user|
        user.email = Faker::Internet.email
        user.password = "secret"
        user.password_confirmation = "secret"

        user.first_name = Faker::Name.first_name
        user.last_name = Faker::Name.last_name
        user.website = Faker::Internet.domain_name
        user.company = Faker::Company.name
        user.bio = Faker::Lorem.sentence(20)
        user.skill_list = [Faker::Lorem.words(1), Faker::Lorem.words(1), Faker::Lorem.words(1)]
        user.learning_list = [Faker::Lorem.words(1), Faker::Lorem.words(1), Faker::Lorem.words(1)]
      end
    end
  end
end