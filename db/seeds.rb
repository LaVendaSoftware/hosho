ActiveRecord::Base.transaction do
  next unless Rails.env.development? || ToBoolean.call(ENV["CI"])

  puts "🚀 Seed started..."

  puts "* Create dev users"
  User.developer.create!(name: "Developer", email: "developer@lavenda.com.br", password: "developer@lavenda.com.br")

  puts "* Create users"
  User.admin.create!(name: "Admin", email: "admin@lavenda.com.br", password: "admin@lavenda.com.br")
  User.standard.create!(name: "Standard", email: "standard@lavenda.com.br", password: "standard@lavenda.com.br")

  puts "✅ Seed finished successfully"
end
