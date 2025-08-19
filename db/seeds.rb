ActiveRecord::Base.transaction do
  next unless Rails.env.development?

  puts "🚀 Seed started..."

  puts "* Create companies"
  Company.other.create!(name: "Some company", nif: "567812349").create_address
  Company.tourism.create!(name: "Sun & Sea Tours", nif: "123456789").create_address
  Company.commerce.create!(name: "HomeStyle Furniture", nif: "987654321").create_address
  Company.food.create!(name: "Bean & Brew Café", nif: "456123789").create_address
  Company.automotive.create!(name: "AutoDrive Dealership", nif: "789321456").create_address

  puts "✅ Seed finished successfully"
end
