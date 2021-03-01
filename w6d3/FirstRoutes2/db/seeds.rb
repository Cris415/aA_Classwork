# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

#Users
artists= User.create!([{username: 'Picasso'},{username: 'VanGogh'}, {username: 'DaVinci'}])
viewers = User.create!([{username: 'moviebuff'},{username: 'artbuff'}, {username: 'artcritic'}])

picasso = User.find_by(username: 'Picasso').id
vangogh = User.find_by(username: 'VanGogh').id
davinci = User.find_by(username: 'DaVinci').id
# p picasso

#Artwork
artworks= Artwork.create!([{title: 'Les Demoiselles dAvignon' , image_url: 'https://www.moma.org/media/W1siZiIsIjQzODQ1MiJdLFsicCIsImNvbnZlcnQiLCItcXVhbGl0eSA5MCAtcmVzaXplIDIwMDB4MTQ0MFx1MDAzZSJdXQ.jpg?sha=8b2a1c3992bba555', artist_id: picasso},
     {title: 'Starry Night', image_url: 'https://cdn.britannica.com/78/43678-050-F4DC8D93/Starry-Night-canvas-Vincent-van-Gogh-New-1889.jpg' , artist_id: vangogh},
     {title: 'Mona Lisa' , image_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/1200px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg', artist_id: davinci},
     {title: 'Violin and Grapes' , image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUHvJvTo67a5Go1nMllV_F_ruL0gMuhod4Yw&usqp=CAU', artist_id: picasso}])
#ArtworkShare

moviebuff = User.find_by(username: 'moviebuff').id
artbuff = User.find_by(username: 'artbuff').id
artcritic = User.find_by(username: 'artcritic').id

lda = Artwork.find_by(title: 'Les Demoiselles dAvignon')
sn =Artwork.find_by(title: 'Starry Night')
ml = Artwork.find_by(title: 'Mona Lisa')
vng =Artwork.find_by(title: 'Violin and Grapes')

p lda
p sn
p ml
p vng




artworkshares = ArtworkShare.create!([
      {artwork_id: lda, viewer_id: moviebuff },
    {artwork_id: lda, viewer_id: moviebuff }, 
    {artwork_id: sn, viewer_id: artbuff},
    {artwork_id: ml, viewer_id: artbuff}, 
    {artwork_id: ml, viewer_id: artcritic},
    {artwork_id: vng, viewer_id: moviebuff}, 
    {artwork_id: vng, viewer_id: artbuff},
    {artwork_id: vng, viewer_id: artcritic},
    {artwork_id: lda, viewer_id: artcritic},
    {artwork_id: sn, viewer_id: moviebuff}
    ])