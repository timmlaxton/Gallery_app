require_relative('../models/artist')
require_relative('../models/exhibiton')

artist1 = Artist.new({'alias' => 'Frank Quietly'})
artist2 = Artist.new({'alias' => 'Geoff Darrow'})
artist3 = Artist.new({'alias' => 'Jack Kirby'})

artist1.save
artist2.save
artist3.save

exhibtion1 = Exhibtion.new({
  'title' => 'The Greens',
  'catergory' => 'comic-art',
  'artist_id => artist1.id'
  })
exhibtion2 = Exhibtion.new({
  'title' => 'Shaolin Cowboy',
  'catergory' => 'comic-art',
  'artist_id => artist2.id'
  })
exhibtion3 = Exhibtion.new({
  'title' => 'Spiderman',
  'catergory' => 'comic-art',
  'artist_id => artist3.id'
  })

exhibtion1.save
exhibtion2.save
exhibtion3.save
