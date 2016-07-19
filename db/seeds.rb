Person.delete_all

12.times do
  Person.create! name: "#{Faker::Name.first_name} #{Faker::Name.last_name}"
end
