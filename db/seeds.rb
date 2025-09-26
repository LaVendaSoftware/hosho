ActiveRecord::Base.transaction do
  next unless Rails.env.development? || ToBoolean.call(ENV["CI"])

  puts "🚀 Seed started..."

  puts "* Create companies"
  some_company = Company.other.create!(name: "Some company", nif: "567812349")
  some_company.create_address
  Company.tourism.create!(name: "Sun & Sea Tours", nif: "123456789").create_address
  Company.commerce.create!(name: "HomeStyle Furniture", nif: "987654321").create_address
  Company.food.create!(name: "Bean & Brew Café", nif: "456123789").create_address
  Company.automotive.create!(name: "AutoDrive Dealership", nif: "789321456").create_address

  puts "* Create dev user"
  User.developer.create!(name: "Walmir", email_address: "walmir@hosho.tech", password: "walmir@hosho.tech")

  puts "* Create admin users"
  User.admin.create!(name: "Caio", email_address: "caio@hosho.tech", password: "caio@hosho.tech")
  User.admin.create!(name: "Alexandre", email_address: "alexandre@hosho.tech", password: "alexandre@hosho.tech")

  puts "* Create manager users"
  User.manager.create!(name: "Manager", email_address: "manager@company.com", password: "manager@company.com", company_ids: [some_company.id])

  puts "✅ Seed finished successfully"
end
