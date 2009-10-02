Factory.define :valid_artist, :class => Artist do |a|
  a.name "Artist"
  a.bio "Biografie"
end

Factory.define :invalid_artist, :class => Artist do |a|
end

