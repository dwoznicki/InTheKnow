user1 = User.create(email: 'p@p.com', password: 'paulpaul')

# Seed tags
tags = ["Arts", "Community", "Education", "Movements", "LGBT", "Food"]
tags.each do |tag|
	Tag.create(subject: tag)
end

# Seed meetup data
meetup_api = MeetupApi.new

category_ids = ["1", "4", "6", "13", "12", "10"]
category_ids.each do |id|
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
	end
end


