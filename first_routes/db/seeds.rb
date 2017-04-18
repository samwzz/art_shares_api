# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(username: 'artist1')
u2 = User.create(username: 'artist2')
u3 = User.create(username: 'viewer1')
u4 = User.create(username: 'viewer2')

a1 = Artwork.create(title: 'Beach', image_url: 'youtube.com', artist_id: u1.id)
a2 = Artwork.create(title: 'Jungle', image_url: 'google.com', artist_id: u2.id)
a3 = Artwork.create(title: 'Mountain', image_url: 'reddit.com', artist_id: u3.id)

s1 = ArtworkShare.create(artwork_id: a1.id, viewer_id: u3.id)
s2 = ArtworkShare.create(artwork_id: a3.id, viewer_id: u1.id)
s3 = ArtworkShare.create(artwork_id: a2.id, viewer_id: u4.id)
s4 = ArtworkShare.create(artwork_id: a2.id, viewer_id: u3.id)
