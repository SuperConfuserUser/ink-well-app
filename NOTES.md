# Models

user
  - username
  - email
  - secure password
  - description
  - avatar
has many pens and inks
has pen types, pen brands through pens
has ink brands through inks
has color families through inks

pens
 - pen type id
 - pen brand id
 - model
 - description (color and/or material)
 - comments
 - user id
 - ink id
 - status
 belongs to user
 belongs to pen brand
 belongs to pen type
 has an ink

 pen type
  - name
 has many pens

 pen brand
  - name
 has many pens

 inks
  - ink brand id
  - name
  - swatch
  - comments
  - status
  - user id
belongs to user
belongs to ink brand
has many color families through ink color families

ink brand
 - name
has many inks

color family
 - name
has many inks through ink color families

ink color family
 - ink id
 - color family id
