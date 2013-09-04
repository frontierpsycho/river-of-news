require 'spec_helper'

describe 'ROXML mapping' do
  describe 'Feed' do
    it 'reads items correctly' do
      xml_data = %Q[
        <?xml version="1.0" encoding="UTF-8"?>
          <items>
            <item>
            </item>
            <item>
            </item>
            <item>
            </item>
            <item>
            </item>
          </items>
        ]

      data = Feed.from_xml xml_data
      expect(data.items.length).to eq(4)
    end
  end
  
  describe 'Item' do
    it 'reads attributes correctly' do
      xml_data = %Q[
        <?xml version="1.0" encoding="UTF-8"?>
          <item>
            <type_of_media>pressrelease</type_of_media>
            <url>http://bash.org</url>
            <language>en</language>
            <published_at datetime="2013-09-04T09:44:02Z">2013-09-04 11:44:02</published_at>

            <header>This is a header.</header>
            <summary>The body below refers to this summary.</summary>
            <body>Ha! We tricked you. This body does not refer to the above summary.</body>
            <image_thumbnail_medium>http://bash.org/favico.gif</image_thumbnail_medium>
          </item>
        ]

      data = Item.from_xml xml_data
      expect(data.type_of_media).to eq('pressrelease')
      expect(data.url).to eq('http://bash.org')
      expect(data.language).to eq('en')
      expect(data.published_at).to be_an_instance_of(DateTime)
      expect(data.header).to eq('This is a header.')
      expect(data.summary).to eq('The body below refers to this summary.')
      expect(data.body).to eq('Ha! We tricked you. This body does not refer to the above summary.')
      expect(data.image_thumbnail_medium).to eq('http://bash.org/favico.gif')
    end
  end
end
