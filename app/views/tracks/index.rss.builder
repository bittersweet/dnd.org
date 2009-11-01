xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "deNachtdienst Tracks"
    xml.description "Tracks on denachtdienst.org"
    xml.link "formatted_articles_url(:rss)"
    
    @tracks.each do |track|
      xml.item do
        xml.title track.name
        xml.description track.description
        xml.pubDate track.created_at.to_s(:rfc822)
        xml.link track_url(track)
        xml.guid track_url(track)
      end
    end
  end
end