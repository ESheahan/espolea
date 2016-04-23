# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Users

#Regular User
admin = User.create(email: "admin@gmail.com", password: "password123", password_confirmation: "password123", first_name: "Admin", last_name: "User", admin: false, gender: "female")
the_clinic = Clinic.find_by(name: "CENTRO NUEVA VIDA EXTRA FORMA")
admin.clinics_id = the_clinic.id
admin.save!

non_admin = User.create(email: "user@gmail.com", password: "password123", password_confirmation: "password123", first_name: "Normal", last_name: "Person", admin: false, gender: "male")

non_admin_2 = User.create(email: "user2@gmail.com", password: "password123", password_confirmation: "password123", first_name: "Other", last_name: "Guy", admin: false, gender: "male")

sudo = User.create(email: "super@gmail.com", password: "password123", password_confirmation: "password123", first_name: "Super", last_name: "Gee", admin: true, gender: "female")


#Reviews
reviews1 = Review.create([
						{ rating: 5, title: "Excellent", body: "This clinic was top notch. The staff were friendly, and they really care about their patients!", user_id: non_admin.id },
						{ rating: 4, title: "Good", body: "This clinic was pretty good. The staff were friendly, but it's too expensive!", user_id: non_admin.id },
						{ rating: 3, title: "Fair", body: "This clinic was acceptable. The staff said hi, but they weren't great.", user_id: non_admin_2.id },
						{ rating: 2, title: "Meh", body: "This clinic was middling. The staff were curt, and they didn't really care about their patients.", user_id: non_admin.id },
						{ rating: 1, title: "Poor", body: "0/10 would not recommend. Stay away if possible!", user_id: non_admin_2.id }
						])

reviews1.each do |review|
	review.clinic_id = the_clinic.id
	review.save!
end

reviews2 = Review.create([
						{ rating: 5, title: "Excellent", body: "This clinic was top notch. The staff were friendly, and they really care about their patients!", user_id: non_admin.id },
						{ rating: 4, title: "Good", body: "This clinic was pretty good. The staff were friendly, but it's too expensive!", user_id: non_admin.id },
						{ rating: 3, title: "Fair", body: "This clinic was acceptable. The staff said hi, but they weren't great.", user_id: non_admin_2.id },
						{ rating: 2, title: "Meh", body: "This clinic was middling. The staff were curt, and they didn't really care about their patients.", user_id: non_admin_2.id },
						{ rating: 1, title: "Poor", body: "0/10 would not recommend. Stay away if possible!", user_id: non_admin.id }
						])

clinic2 = Clinic.find_by(name: "CENTRO NUEVA VIDA FORMA GONZALEZ ORTEGA")
reviews2.each do |review|
	review.clinic_id = clinic2.id
	review.save!
end

reviews3 = Review.create([
						{ rating: 5, title: "Excellent", body: "This clinic was top notch. The staff were friendly, and they really care about their patients!", user_id: non_admin.id },
						{ rating: 4, title: "Good", body: "This clinic was pretty good. The staff were friendly, but it's too expensive!", user_id: non_admin_2.id },
						{ rating: 3, title: "Fair", body: "This clinic was acceptable. The staff said hi, but they weren't great.", user_id: non_admin.id },
						{ rating: 2, title: "Meh", body: "This clinic was middling. The staff were curt, and they didn't really care about their patients.", user_id: non_admin_2.id },
						{ rating: 1, title: "Poor", body: "0/10 would not recommend. Stay away if possible!", user_id: non_admin.id }
						])

clinic3 = Clinic.find_by(name: "CENTRO NUEVA VIDA ORIZABA")
reviews3.each do |review|
	review.clinic_id = clinic3.id
	review.save!
end