require './client'
require 'awesome_print'

client = Client.new('test', '1b34-2d7896-45b7-8d-7a8c317896-4')

puts 'Get doctors:'

doctors = Hash[client.doctors]

puts "Count: #{doctors[:offers][:@attributes][:count]}"

doctors[:offers][:offer].each do |item|
  ap item
end

puts 'Get addresses:'

addresses = Hash[client.addresses]

puts "Count: #{addresses[:offers][:@attributes][:count]}"

addresses[:offers][:offer].each do |item|
  ap item
end