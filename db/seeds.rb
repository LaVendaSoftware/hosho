ActiveRecord::Base.transaction do
  next unless Rails.env.development?

  puts "🚀 Seed started..."

  puts "* Create companies"
  Company.other.create!(name: "Some company", nif: "567812349")
  Company.tourism.create!(name: "Sun & Sea Tours", nif: "123456789")
  Company.commerce.create!(name: "HomeStyle Furniture", nif: "987654321")
  Company.food.create!(name: "Bean & Brew Café", nif: "456123789")
  Company.automotive.create!(name: "AutoDrive Dealership", nif: "789321456")

  puts "✅ Seed finished successfully"
end
