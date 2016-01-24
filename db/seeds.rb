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

messages = [
  {
    body: "Impacting Global Poverty",
    end_date: "January 27",
    organization_name: "Economic Round Table of San Francisco",
    organization_url: "http://www.meetup.com/ERT-SF/events/227952032/",
    tags: ["activism"]
  },
{
    body: "Musician, Poet and Healer Mamacoatl to be Honored at Brava Theater",
    end_date: "January 24",
    organization_name: "missionlocal",
    organization_url: "feedly.com",
    tags: ["arts", "communityorg", "activism"]
  },

  {
    body: "Margaret Hayward Playground Improvement Project Planning Meeting",
    end_date: "JANUARY 27TH",
    organization_name: "SF Parks and Rec",
    organization_url: "http://sfrecpark.org/",
    tags: ["communityorg", "Environment"]
  },

  {
    body: "Community Meeting on Proposed TWIN PEAKS MOUNT SUTRO TRAIL CONNECTOR",
    end_date: "JANUARY 27TH",
    organization_name: "SF Parks and Rec",
    organization_url: "http://sfrecpark.org/",
    tags: ["communityorg", "Environment"]
  },

  {
    body: "Wildcat Canyon Loop HIKE (6 miles)",
    end_date: "January 30",
    organization_name: "Sierra Club",
    organization_url: "http://content.sierraclub.org/tags/san-francisco",
    tags: ["Environment", "Hiking"]
  },

{
    body: "San Francisco Community Leader Happy hour",
    end_date: "February 8",
    organization_name: "Meetup",
    organization_url: "meetup.com",
    tags: ["tech", "communityorgs"]
  },

{
    body: "Hike at Briones Park - Pleasant Hill",
    end_date: "January 24",
    organization_name: "Napa Hill Hiking and Fitness Club",
    organization_url: "http://www.meetup.com/Napa-Hill-Hiking-and-Fitness-Club/events/228067133/",
    tags: ["Environment", "Hiking"]
  },

{
    body: "Wicca Wimmin's Full Moon Ritual of Pagan Goddess",
    end_date: "January 23",
    organization_name: "Wicca Wimmin's Moon Ritual of Marin",
    organization_url: "http://www.meetup.com/Wicca-Wimmins-Moon-Ritual-of-Marin/events/227704857/",
    tags: ["womens-empowerment"]
  },

{
    body: "Women-Start-The-Business-You-Love",
    end_date: "Women-Start-The-Business-You-Love",
    organization_name: "Female leaders",
    organization_url: "http://www.meetup.com/East-Bay-Women-Start-The-Business-You-Love/events/226823190/",
    tags: ["womens-empowerment"]
  },

]
# messages.each do |message|
# 	organization = Organization.find_or_create_by(name: message['organization_name'], url: message['organization_url'])
# 	message = Message.create(body: message['body'], start_date: message['end_date'])
# 	message['tags'].each do |name|
# 		tag = Tag.find_or_create_by()
# 	end
# end
