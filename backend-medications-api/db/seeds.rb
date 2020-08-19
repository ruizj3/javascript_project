# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Doctor.create(username: 'Joseph', password: '1234')
Doctor.create(username: 'Mr. Medicine', password: '1234')
Doctor.create(username: 'Mrs. Drugs', password: '1234')

Patient.create(username: 'Jim', password: '1234', dob: '1969-01-01', ethnicity: 'Caucasian', doctor_id: 1)
Patient.create(username: 'Bob', password: '1234', dob: '2000-01-01', ethnicity: 'Black', doctor_id: 1)
Patient.create(username: 'Mochi', password: '1234', dob: '2013-01-01', ethnicity: 'Cat', doctor_id: 2)
Patient.create(username: 'Apple', password: '1234', dob: '2013-01-01', ethnicity: 'Cat', doctor_id: 2)

Medication.create(name: 'Xanax', priceperpill: 100)
Medication.create(name: 'Molly', priceperpill: 7)
Medication.create(name: 'Percocet', priceperpill: 10)
Medication.create(name: 'Syrup', priceperpill: 8)

Prescription.create(dosagestotal: 100, dosagesper: 2, dosagesfrequency: 'Daily', patient_id: 1, medication_id: 1)
Prescription.create(dosagestotal: 51, dosagesper: 3, dosagesfrequency: 'Daily', patient_id: 1, medication_id: 2)
