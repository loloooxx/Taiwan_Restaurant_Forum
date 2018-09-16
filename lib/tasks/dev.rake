namespace :dev do
  task fake_restaurant: :environment do
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

  task fake_user: :environment do
    User.destroy_all
    
    20.times do |i|
      User.create!(
        email: FFaker::Internet.disposable_email,
        password: FFaker::Internet.password,
        name: FFaker::Name.first_name
        )
    end
    puts "have created 20 fake users"
  end

  task fake_comment: :environment do
    Comment.destroy_all

    Restaurant.all.each do |restaurant|
      3.times do |i|
        restaurant.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
          )
      end
    end
    puts "you have created 3 comment below each restaurant"
  end
end

