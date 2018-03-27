pen_types = [
  "Fountain",
  "Gel",
  "Rollerball",
  "Ballpoint",
  "Felt Tip",
  "Brush"]

pen_types.each {|t| PenType.create(name: t)}



color_families = [
  "black",
  "blue",
  "red",
  "yellow",
  "green",
  "orange",
  "purple",
  "pink",
  "gray",
  "brown",
  "dark",
  "light",
  "shimmer",
  "metallic",
  "other"
]

color_families.each {|c| ColorFamily.create(name: c)}


User.create!(username: 'foo',
             email: 'foo@bar.com',
             password_digest: BCrypt::Password.create('password'))

User.create!(username: 'user',
             email: 'user@internet.com',
             tagline: 'I exist everywhere.',
             password_digest: BCrypt::Password.create('password'))

User.create!(username: 'TheBard',
             email: 'thebard@theatre.com',
             name: 'William Shakespeare',
             tagline: 'The pen is mightier than the sword.',
             password_digest: BCrypt::Password.create('password'))
