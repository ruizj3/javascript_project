# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Doctor.create(username: 'Joseph', password: '1234')

Patient.create(username: 'Jim', password: '1234', dob: '1969-01-01', ethnicity: 'Caucasian', doctor_id: 1)
