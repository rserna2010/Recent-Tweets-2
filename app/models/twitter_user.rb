class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
   Twitter.user_timeline(self.username, :count => 200).each do |tweet|
      self.tweets << Tweet.create(text: tweet.text)
    end
  end

  def tweets_stale?
    puts ((Time.now - self.tweets.first.created_at) / 60)
  end
end
