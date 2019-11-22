# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Users
users = User.create([
    {username: 'abel'}, 
    {username: 'maya'}, 
    {username: 'fuji'}
  ])
artworks = Artwork.create([
    { title: 'popcorn', artist_id: users.last.id, image_url: '/artworks/1' }, 
    { title: 'siggis', artist_id: 2, image_url: '/artworks/2' }
  ])
artwork_shares = ArtworkShare.create([
    { artwork_id: 1, viewer_id: 1 }, 
    { artwork_id: 2, viewer_id: 1 }, 
    { artwork_id: 2, viewer_id: 3 }, 
    { artwork_id: 2, viewer_id: 2}
  ])