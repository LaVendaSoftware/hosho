ActiveRecord::Base.transaction do
  next unless Rails.env.development? || ToBoolean.call(ENV["SEED_SMOKE_TEST"])

  puts "🚀 Seed started..."

  puts "## Create app users"

  puts " * Create dev user"
  User.developer.create!(name: "Walmir", email_address: "walmir@hosho.tech", password: "walmir@hosho.tech")

  puts " * Create admin users"
  User.admin.create!(name: "Caio", email_address: "caio@hosho.tech", password: "caio@hosho.tech")
  User.admin.create!(name: "Alexandre", email_address: "alexandre@hosho.tech", password: "alexandre@hosho.tech")

  puts "## Catavento - Create company"
  catavento = Company.other.create!(name: "Catavento Digital", nif: "49671710000132")
  catavento.create_address(
    country: "BR",
    addressable: catavento,
    zip_code: "02410-010",
    street_name: "Rua João de LAET",
    building_number: "1338",
    district: "Vila Aurora (Zona Norte)",
    city: "São Paulo",
    state: "SP"
  )

  puts " * Catavento - Create manager users"
  User.manager.create!(
    name: "Adriano Lima",
    email_address: "adriano.lima@cataventodigital.com.br",
    password: "adriano.lima@cataventodigital.com.br",
    company_ids: [catavento.id]
  )

  puts " * Catavento - Create categories and products"
  livros = catavento.categories.create!(title: "Livros")
  catavento.products.create!(
    category: livros,
    title: "Material didático de robótica",
    variants_attributes: [
      {title: "Do 1º ao 5º ano", price: 100},
      {title: "Do 6º ao 9º ano", price: 150},
      {title: "Ensino médio", price: 200}
    ]
  )

  puts " * Catavento - Create customers"
  Customer.create!(
    document: "21038579414",
    country_code: "55",
    phone: "81988602327",
    user_attributes: {
      name: "Emanuel Freitas",
      email_address: "pai@cataventodigital.com.br",
      password: "pai@cataventodigital.com.br",
      company_ids: [catavento.id]
    },
    address_attributes: {
      country: "BR",
      zip_code: "52081730",
      street_name: "Rua da Carola",
      building_number: "851",
      district: "Vasco da Gama",
      city: "Recife",
      state: "PE",
    }
  )

  puts "## Dummy - Create company"
  some_company = Company.other.create!(name: "Some company", nif: "567812349")
  some_company.create_address(country: Addresses::Countries::DIALING_CODES.keys.sample)
  Company.tourism.create!(name: "Sun & Sea Tours", nif: "123456789").create_address(country: Addresses::Countries::DIALING_CODES.keys.sample)
  Company.commerce.create!(name: "HomeStyle Furniture", nif: "987654321").create_address(country: Addresses::Countries::DIALING_CODES.keys.sample)
  Company.food.create!(name: "Bean & Brew Café", nif: "456123789").create_address(country: Addresses::Countries::DIALING_CODES.keys.sample)
  Company.automotive.create!(name: "AutoDrive Dealership", nif: "789321456").create_address(country: Addresses::Countries::DIALING_CODES.keys.sample)

  puts " * Dummy - Create manager users"
  User.manager.create!(name: "Manager", email_address: "manager@company.com", password: "manager@company.com", company_ids: [some_company.id])

  puts " * Dummy - Create seller users"
  User.seller.create!(name: "Seller", email_address: "seller@company.com", password: "seller@company.com", company_ids: [some_company.id])

  puts " * Dummy - Create buyer users"
  User.standard.create!(name: "Buyer", email_address: "buyer@personal.com", password: "buyer@personal.com", company_ids: [some_company.id])

  puts "✅ Seed finished successfully"
end
