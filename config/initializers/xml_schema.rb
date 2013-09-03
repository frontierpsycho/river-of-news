class Item
  include ROXML

  xml_reader :newsdeskML
  xml_reader :type_of_media
  xml_reader :language
  xml_reader :url
  xml_reader :published_at

  xml_reader :header
  xml_reader :summary
  xml_reader :image_thumbnail_medium
end

class Feed
  include ROXML

  xml_reader :items, as: [Item]
end
