Patient.delete_all

input_file = Rails.root.join('lib/patients.csv')

CSV.foreach(input_file) do |row|

  patient = Patient.new
  patient.name = row[0]
  patient.age = row[1]
  patient.gender = row[2]
  patient.image = row[3]
  patient.phone_no = row[4]
  patient.address = row[5]
  patient.email = row[6]
  patient.password = row[7]
  patient.about = row[8]
  patient.save
  
end