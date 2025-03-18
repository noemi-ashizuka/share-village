require "open-uri"

url = "https://core.dxpapi.com/api/v1/core/?q=cribs&rows=16&sort=&start=0&account_id=7649&domain_key=buybuybaby&request_id=4198420296701&_br_uid_2=uid%3D6223191236977%3Av%3D16.1%3Ats%3D1741322074984%3Ahc%3D7&ref_url=https%3A%2F%2Fbuybuybaby.com%2Fcollections%2Fstrollers&url=https%3A%2F%2Fbuybuybaby.com%2Fcollections%2Fstrollers&request_type=search&search_type=category&fl=pid%2Ctitle%2Cbrand%2Cprice%2Csale_price%2Cthumb_image%2Csku_thumb_images%2Csku_swatch_images%2Csku_color_group%2Curl%2Cprice_range%2Csale_price_range%2Cdescription%2Crating%2Cbadge_bg_color%2Cbadge_color%2Cbadge_name&facet.range=price&stats.field=price"
json = URI.open(url).read
data = JSON.parse(json)

p data["response"]["docs"].count

data["response"]["docs"].each do |product|
  p product["title"]
  p product["thumb_image"]
  p product["rating"]
end
