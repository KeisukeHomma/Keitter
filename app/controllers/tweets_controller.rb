class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  
  def index
    @tweets = Tweet.all
  end
  
  def new
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end
  
  def create
    @tweet = Tweet.create(tweets_params)
    if @tweet.save
      redirect_to tweets_path, notice: "Successfully Tweeted!"
    else
      render action: 'new'
    end
  end
  
  def edit
  end
  
  def update
    @tweet.update(tweets_params)
    if @tweet.save
      redirect_to tweets_path, notice: "編集に成功しました！"
    else
      render action: 'update'
    end
  end
  
  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "しっかりと片付けておきましたよ！"
  end
  
  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
    
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
  
end
