require "open-uri"
require "faker"

Item.destroy_all
Invitation.destroy_all
User.destroy_all
Community.destroy_all


puts "Creating 10 users"

10.times do
  first_name = Faker::Name.first_name 
  last_name = Faker::Name.last_name
  User.create!( first_name: first_name, last_name: last_name, email: "#{first_name}@mail.com", password: "123456")
end

puts "Making a community"

village = Community.create!(name: "The village people", description: "A friendly community in Setagaya to share children things")

puts "Assigning user to the community"

User.all.each do |user|
  UserCommunity.create!(user: user, community: village, role: :member)
end

strollers_url = "https://core.dxpapi.com/api/v1/core/?q=strollers&rows=16&sort=&start=0&account_id=7649&domain_key=buybuybaby&request_id=4198420296701&_br_uid_2=uid%3D6223191236977%3Av%3D16.1%3Ats%3D1741322074984%3Ahc%3D7&ref_url=https%3A%2F%2Fbuybuybaby.com%2Fcollections%2Fstrollers&url=https%3A%2F%2Fbuybuybaby.com%2Fcollections%2Fstrollers&request_type=search&search_type=category&fl=pid%2Ctitle%2Cbrand%2Cprice%2Csale_price%2Cthumb_image%2Csku_thumb_images%2Csku_swatch_images%2Csku_color_group%2Curl%2Cprice_range%2Csale_price_range%2Cdescription%2Crating%2Cbadge_bg_color%2Cbadge_color%2Cbadge_name&facet.range=price&stats.field=price"
json = URI.open(strollers_url).read
data = JSON.parse(json)

p data["response"]["docs"].count

puts "Scraping and creating strollers"

data["response"]["docs"].each do |product|
  if product["description"].include?("<style ") ||  product["description"].include?("<span ") ||  product["description"].include?("<div ")
    product["description"] = product["description"].split(/<\/.+>/).last
  end
  description = product["description"].split("</").first.gsub(/<.>/, "")
  item = Item.new(name: product["title"], description: description, price: rand(200..3000), user: User.all.sample)
  file = URI.parse(product["thumb_image"]).open
  puts "Attacching photo to stroller..."
  item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
  item.save!
  puts "#{item.name} created!"
end

cots_url = "https://core.dxpapi.com/api/v1/core/?q=cot&rows=16&sort=&start=0&account_id=7649&domain_key=buybuybaby&request_id=7217458892743&_br_uid_2=uid%3D6223191236977%3Av%3D16.1%3Ats%3D1741322074984%3Ahc%3D14&ref_url=https%3A%2F%2Fbuybuybaby.com%2Fsearch%3Fq%3Dcot&url=https%3A%2F%2Fbuybuybaby.com%2Fsearch%3Fq%3Dcot&request_type=search&search_type=keyword&fl=pid%2Ctitle%2Cbrand%2Cprice%2Csale_price%2Cthumb_image%2Csku_thumb_images%2Csku_swatch_images%2Csku_color_group%2Curl%2Cprice_range%2Csale_price_range%2Cdescription%2Crating%2Cbadge_bg_color%2Cbadge_color%2Cbadge_name&facet.range=price&stats.field=price"

json = URI.open(cots_url).read
data = JSON.parse(json)

p data["response"]["docs"].count

puts "Scraping and creating cots"

data["response"]["docs"].each do |product|
  if product["description"].include?("<style ") ||  product["description"].include?("<span ") ||  product["description"].include?("<div ")
    product["description"] = product["description"].split(/<\/.+>/).last
  end
  description = product["description"].split("</").first.gsub(/<.>/, "")
  item = Item.new(name: product["title"], description: description, price: rand(200..3000), user: User.all.sample)
  file = URI.parse(product["thumb_image"]).open
  puts "Attacching photo to cot..."
  item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
  item.save!
  puts "#{item.name} created!"
end

car_seats_url = "https://core.dxpapi.com/api/v1/core/?q=car-seat&rows=16&sort=&start=0&account_id=7649&domain_key=buybuybaby&request_id=4526989092098&_br_uid_2=uid%3D6223191236977%3Av%3D16.1%3Ats%3D1741322074984%3Ahc%3D17&ref_url=https%3A%2F%2Fbuybuybaby.com%2Fsearch%3Fq%3Dcar-seat&url=https%3A%2F%2Fbuybuybaby.com%2Fsearch%3Fq%3Dcar-seat&request_type=search&search_type=keyword&fl=pid%2Ctitle%2Cbrand%2Cprice%2Csale_price%2Cthumb_image%2Csku_thumb_images%2Csku_swatch_images%2Csku_color_group%2Curl%2Cprice_range%2Csale_price_range%2Cdescription%2Crating%2Cbadge_bg_color%2Cbadge_color%2Cbadge_name&facet.range=price&stats.field=price"

json = URI.open(car_seats_url).read
data = JSON.parse(json)

p data["response"]["docs"].count

puts "Scraping and creating car seats"

data["response"]["docs"].each do |product|
  if product["description"].include?("<style ") ||  product["description"].include?("<span ") ||  product["description"].include?("<div ")
    product["description"] = product["description"].split(/<\/.+>/).last
  end
  description = product["description"].split("</").first.gsub(/<.>/, "")
  item = Item.new(name: product["title"], description: description, price: rand(200..3000), user: User.all.sample)
  file = URI.parse(product["thumb_image"]).open
  puts "Attacching photo to car seat..."
  item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
  item.save!
  puts "#{item.name} created!"
end

bikes_url = "https://core.dxpapi.com/api/v1/core/?q=bikes&rows=16&sort=&start=0&account_id=7649&domain_key=buybuybaby&request_id=7869000746298&_br_uid_2=uid%3D6223191236977%3Av%3D16.1%3Ats%3D1741322074984%3Ahc%3D18&ref_url=https%3A%2F%2Fbuybuybaby.com%2Fsearch%3Fq%3Dbikes&url=https%3A%2F%2Fbuybuybaby.com%2Fsearch%3Fq%3Dbikes&request_type=search&search_type=keyword&fl=pid%2Ctitle%2Cbrand%2Cprice%2Csale_price%2Cthumb_image%2Csku_thumb_images%2Csku_swatch_images%2Csku_color_group%2Curl%2Cprice_range%2Csale_price_range%2Cdescription%2Crating%2Cbadge_bg_color%2Cbadge_color%2Cbadge_name&facet.range=price&stats.field=price"

json = URI.open(bikes_url).read
data = JSON.parse(json)

p data["response"]["docs"].count

puts "Scraping and creating bikes"

data["response"]["docs"].each do |product|
  if product["description"].include?("<style ") ||  product["description"].include?("<span ") ||  product["description"].include?("<div ")
    product["description"] = product["description"].split(/<\/.+>/).last
  end
  description = product["description"].split("</").first.gsub(/<.>/, "")
  item = Item.new(name: product["title"], description: description, price: rand(200..3000), user: User.all.sample)
  file = URI.parse(product["thumb_image"]).open
  puts "Attacching photo to bike..."
  item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
  item.save!
  puts "#{item.name} created!"
end

bath_url = "https://core.dxpapi.com/api/v1/core/?q=bath%20tub&rows=16&sort=&start=0&account_id=7649&domain_key=buybuybaby&request_id=2936913759530&_br_uid_2=uid%3D6223191236977%3Av%3D16.1%3Ats%3D1741322074984%3Ahc%3D19&ref_url=https%3A%2F%2Fbuybuybaby.com%2Fsearch%3Fq%3Dbath%2Btub&url=https%3A%2F%2Fbuybuybaby.com%2Fsearch%3Fq%3Dbath%2Btub&request_type=search&search_type=keyword&fl=pid%2Ctitle%2Cbrand%2Cprice%2Csale_price%2Cthumb_image%2Csku_thumb_images%2Csku_swatch_images%2Csku_color_group%2Curl%2Cprice_range%2Csale_price_range%2Cdescription%2Crating%2Cbadge_bg_color%2Cbadge_color%2Cbadge_name&facet.range=price&stats.field=price"

json = URI.open(bath_url).read
data = JSON.parse(json)

p data["response"]["docs"].count

puts "Scraping and creating baths"

data["response"]["docs"].each do |product|
  if product["description"].include?("<style ") ||  product["description"].include?("<span ") ||  product["description"].include?("<div ")
    product["description"] = product["description"].split(/<\/.+>/).last
  end
  description = product["description"].split("</").first.gsub(/<.>/, "")
  item = Item.new(name: product["title"], description: description, price: rand(200..3000), user: User.all.sample)
  file = URI.parse(product["thumb_image"]).open
  puts "Attacching photo to bath..."
  item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
  item.save!
  puts "#{item.name} created!"
end

puts "Done!"
