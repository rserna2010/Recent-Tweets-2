
get '/' do


    @user = TwitterUser.find_by_username(params[:username])
    if @user.tweets.empty? || @user.tweets_stale?
    
      puts "stale"
      @user.fetch_tweets!
    end

    @ten_tweets = @user.tweets
    erb :_tweets, :layout => false
  
end

post '/twitteruser' do 
  @new_user = TwitterUser.find_or_create_by_username(params[:username])

  redirect to "/"
end


