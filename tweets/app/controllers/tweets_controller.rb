class TweetsController < ApplicationController
  before_action :get_tweet, only: [:edit, :update, :destroy]
  before_action :check_auth, :only => [:edit, :update, :destroy]

  def get_tweet
  	@tweet = Tweet.find(params[:id])
  end

  def check_auth
  	if session[:baller_id] != @tweet.baller_id
  		flash[:notice] = "Sorry, you can't edit this tweet"
  		redirect_to(tweets_path)
  	end
  end 

  def index
  	if params[:name]
  		@baller = Baller.where(name: params[:name]).first
  		@tweets = @baller.tweets
  	else
  		@tweets = Tweet.all
  	end
  end

  def show
  end

  def new
  	@tweet = Tweet.new
  end

  def edit
  end

  def update
  end

  def delete
  end
end
