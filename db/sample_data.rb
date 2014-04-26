puts 'creating sample data...'

100.times do |x|
	print '.'
  u = x + 1
	Animal.create!(
    name: Faker::Name.first_name,
    licence: "000#{u}",
    licence_amount: [15, 30, 45, 50].sample,
    animal_type: ['cat', 'mouse', 'sheep', 'pig', 'rooster', 'tweetbird', 'penguin'].sample,
    owner: [Faker::Name.first_name, Faker::Name.last_name].join(" ")
	)
end