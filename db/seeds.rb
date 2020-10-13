areas = ["東京", "札幌", "仙台", "横浜", "名古屋", "大阪", "福岡", "広島"]
30.times do |n|
  ar = areas.sample
  Room.create!(
    name: "#{ar}会議室 No#{n}",
    place: "#{ar}#{n}",
    number: 10,
    terms_of_use: "#{ar}の利用要綱を承諾すること"
  )
end
puts "30 件データ作成完了"

20.times do |n|
  rdate = Time.now + n.days
  Entry.create!(
    reserved_date: rdate,
    user_name: "ABC#{n}",
    user_email: "abc#{n}@sample.com",
    usage_time: 2,
    room_id: 1,
    people: 5
  )
end
puts "20 件データ作成完了"
