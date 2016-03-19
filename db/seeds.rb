# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
puts "Deleting all records from the database..."
User.delete_all
Patient.delete_all
FamilyRelationship.delete_all
CareproRelationship.delete_all
Rating.delete_all
Illness.delete_all
Activity.delete_all
CalendarEvent.delete_all

puts "Creating Users..."
jim = User.create(name: "Jim Jones", password: "5555", iscarepro: "family member", image: "Jim-son.jpg", gender: "male", phone_no: "847-723-1934", address: "Park evanston apt.501, Evanston IL 60201", email: "jjones@gmail.com", about: "I am available 24/7 for calls regarding my mom")
michelle = User.create(name: "Michelle Jones", password: "3333", iscarepro: "family member", image: "Michelle-daughter.jpg", gender: "female", phone_no: "847-323-1934", address: "Sherman Plaza apt.701, Evanston IL 60201", email: "michjones@gmail.com", about: "Mom wants constant attention, so please be careful")
tina = User.create(name: "Tina Gesundheit", password: "2222", iscarepro: "carepro", hourlyrate: "35", image: "Tina-carepro_female.jpg", gender: "female", phone_no: "213-555-0000", address: "1410 Chicago Apt.501, Evanston IL 60201" , email: "tinatinaa11@gmail.com", about: "I have worked in this field for 10 years", specialty: "grooming, cooking, feeding")
franklin = User.create(name: "Franklin Atchoo", password: "1111", iscarepro: "carepro", hourlyrate: "20", image: "Franklin-carepro_male.jpg", gender: "male", phone_no: "213-333-2222", address: "1400 Chicago Apt.101, Evanston IL 60201" , email: "frankfranklinlin@gmail.com",  about: "I have great empathy towards seniors", specialty: "cleaning, groceries")

puts "Creating Patients..."
mary = Patient.create(name: "Mary Jones", age: "70", gender: "female", image: "Mary-senior_female.jpg", phone_no: "847-123-1234", address: "1500 Chicago Apt.203, Evanston IL 60201" , email: "jumpingjacks@gmail.com", password: "1234", about: "Has problem eating solid food")
tom = Patient.create(name: "Tom Mann", age: "75", gender: "male", image: "Tom-senior_male.jpg", phone_no: "847-555-1235", address: "1600 Chicago Apt.310, Evanston IL 60201" , email: "hopethisworks@gmail.com", password: "abcd", about: "He doesn't like dogs")
# how do you show family relationship?

puts "Creating Family relationships..."
FamilyRelationship.create(patient_id: mary.id, user_id: jim.id)
FamilyRelationship.create(patient_id: mary.id, user_id: michelle.id)

puts "Creating Carepro relationships..."
CareproRelationship.create(patient_id: mary.id, user_id: tina.id)
CareproRelationship.create(patient_id: mary.id, user_id: franklin.id)

puts "Creating Ratings"
Rating.create(user_id: tina.id, rating: 3)
Rating.create(user_id: franklin.id, rating: 2)

puts "Creating Illnesses..."
als = Illness.create(name: "ALS")
cancer = Illness.create(name: "Cancer")
dementia = Illness.create(name: "Dementia")
diabetes = Illness.create(name: "Diabetes")

puts "Creating Patient Illness relationships..."
PatientIllness.create(patient_id: mary.id, illness_id: als.id)
PatientIllness.create(patient_id: mary.id, illness_id: diabetes.id)
PatientIllness.create(patient_id: tom.id, illness_id: cancer.id)

puts "Creating Activities..."
Activity.create(name: "Grooming")
Activity.create(name: "Groceries")
Activity.create(name: "Transportation")
Activity.create(name: "Exercise")
Activity.create(name: "Medication reminder")

puts "Creating Calendar events..."
CalendarEvent.create(patient_id: mary.id, user_id: tina.id)
CalendarEvent.create(patient_id: mary.id, user_id: franklin.id)

puts "There are now #{User.count} users, #{Patient.count} patients, #{Illness.count} illnesses, and #{Activity.count} activities in the database."
