Role.find_or_create_by(name: "HR")
Role.find_or_create_by(name: "Examinor")

hr_user=User.find_or_create_by(email: 'hr@bacancy.com') do |user|
  user.password = 'Bacancy@123'
  user.password_confirmation = 'Bacancy@123'
end
hr_user.add_role :HR
