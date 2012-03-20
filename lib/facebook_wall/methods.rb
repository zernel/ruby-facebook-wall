module FacebookWall
  def self.feed_url(id)
    "http://www.facebook.com/feeds/page.php?id=#{id.to_s}&format=rss20"
  end

  def self.posts_by(id)
    feed = RSS::Parser.fetch_and_parse feed_url id
    Factories::create_posts feed, Factories::create_feed_entry_filter_chain
  end
end