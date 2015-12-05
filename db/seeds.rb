# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


names = ["Alejandra", "Francisca", "Camila", "Marcela", "Javiera", "Diego", "Nico", "Gonzalo", "Pablo", "Gordo"]


10.times do |i|
  u = User.new
  u.name = names[i]
  u.email = names[i] + "@desafiolatam.com"
  u.password = "12345678"

  File.open(File.join(Rails.root, 'db', 'data', "#{i + 1}.jpg")) do |f|
    u.photos.build(photo: f)
  end

  u.save
end