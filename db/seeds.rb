user1 = User.create(username: 'Paul', email: 'p@p.com', password: 'paulpaul')

# Seed meetup data
meetup_api = MeetupApi.new

category_ids = {
	"1" => "Arts",
	"4" => "Community",
	"6" => "Education",
	"13" => "Movements",
	"12" => "LGBT",
	"10" => "Food",
}

category_ids.each do |id, category|
	params = {
		category: id,
		country: 'us',
		state: 'CA',
		city: 'San Francisco',
		format: 'json',
		page: '15'
	}
	events = meetup_api.open_events(params)
	events['results'].each do |event|
		organization = Organization.find_or_create_by(name: event['group']['name'], url: "www.meetup.com/#{event['group']['urlname']}")
		message = Message.create(body: event['name'], start_date: Time.at(event['time']), organization_id: organization.id)
		tag = Tag.find_or_create_by(subject: category)
		message.tags << tag
	end
end

messages.each do |message|
	
end
