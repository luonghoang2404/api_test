# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do 
  @department = Department.create(name: Faker::Commerce.department)
  managers_numbers = Random.rand(1..5)
  managers_numbers.times do
    manager = @department.employees.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: 20 + Random.rand(20))
    Random.rand(1..10).times do
      @department.employees.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: 20 + Random.rand(20), manager_id: manager.id)
    end
  end
end

Department.all.each do |d|
  managers_numbers = Random.rand(1..5)
  managers_numbers.times do
    manager = d.employees.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: 20 + Random.rand(20))
    Random.rand(1..10).times do
      d.employees.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: 20 + Random.rand(20), manager_id: manager.id)
    end
  end
end