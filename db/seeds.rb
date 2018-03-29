pen_types = [
  "fountain",
  "gel",
  "rollerball",
  "ballpoint",
  "felt tip",
  "brush"]

pen_types.each {|t| PenType.create(name: t)}



color_families = [
  "black",
  "blue",
  "red",
  "orange",
  "yellow",
  "green",
  "violet",
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


User.create!(username: 'foobar',
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
             avatar_link: 'thebard',
             password_digest: BCrypt::Password.create('password'))
