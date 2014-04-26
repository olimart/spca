puts 'creating sample data...'

100.times do |x|
	print '.'
  u = x + 1
	Animal.create!(
    name: Faker::Name.first_name,
    licence: "000#{u}",
    animal_type: ['cat', 'mouse', 'sheep', 'pig', 'rooster', 'tweetbird', 'penguin'].sample
	)
end