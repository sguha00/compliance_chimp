# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.mongo_session['roles'].insert(name: role)
  puts 'role: ' << role
end

def fix_new_lines(string)
  string.gsub(/\\n/, "\n") unless string.blank?
end

def remove_name(string)
  string.gsub(/^\d+(\.\d+|\.[a-z]+)+\s/, "")
end

require 'csv'
puts 'importing Requirements table from csv'
CSV.foreach('db/csv/PCI_requirements.csv', headers: true) do |row|
  puts "processing requirement #{row["name"]}"
  record = Requirement.new(name: row['name'],
                           description: fix_new_lines(remove_name(row['description'])),
                           testing_procedure: fix_new_lines(remove_name(row['testing_procedure'])),
                           guidance: fix_new_lines(row['guidance']))
  record.save!
end
