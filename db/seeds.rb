ActiveRecord::Base.transaction do
  next unless Rails.env.development?

  puts "🚀 Seed started..."

  puts "* Create companies"
  Company.tourism.create!(name: "Sun & Sea Tours", nif: "12345678-9")
  Company.commerce.create!(name: "HomeStyle Furniture", nif: "98765432-1")
  Company.food.create!(name: "Bean & Brew Café", nif: "45612378-9")
  Company.automotive.create!(name: "AutoDrive Dealership", nif: "78932145-6")

  puts "✅ Seed finished successfully"
end
