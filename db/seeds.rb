Person.delete_all

8.times do
  Person.create! name: "#{Faker::Name.first_name} #{Faker::Name.last_name}"
end
