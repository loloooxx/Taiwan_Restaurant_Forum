namespace :dev do
  task fake: :environment do
    Restaurant.destroy_all

    100.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample
      )
    end
    puts "have created fake restaurant"
    puts "now you have #{Restaurant.count} rerstaurant data"
  end
end