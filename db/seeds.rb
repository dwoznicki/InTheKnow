user1 = User.create(email: 'p@p.com', password: 'paulpaul')

spca = Organization.create(name: 'spca', url: 'www.spca.com')
sierra_club = Organization.create(name: 'Sierra Club', url: 'www.sc.com')

tag1 = Tag.create(subject: 'pet adoption')
tag2 = Tag.create(subject: 'tree preservation')
tag3 = Tag.create(subject: 'species preservation')

msg1 = spca.messages.create(body: 'save the whales parade')
msg1.message_tags.create(tag_id: tag3.id)

msg2 = Message.create(body: 'come check out the pooches at the humane society')
msg2.message_tags.create(tag_id: tag1.id)

msg3 = Message.create(body: 'adopt a cat today')
msg3.message_tags.create(tag_id: tag1.id)






