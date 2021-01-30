# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

file = File.read('public/zone.json')
times = JSON.parse(file)

times.each do |t|
    t['utc'].each do |i|
        cityName = i.split('/')[-1]
        City.create(
            name: cityName.gsub("_", " ").downcase,
            timezone: i
        )
    end
end

times.each do |t|
    t['text'].gsub!("(","_")
    t['text'].gsub!(")","_")
    City.create(
        name: t['text'].split("_")[1].downcase.split(":")[0],
        timezone: t['utc'][0]
    )
end