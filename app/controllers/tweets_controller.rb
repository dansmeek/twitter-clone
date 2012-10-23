class TweetsController < ApplicationController
  before_filter :login_required

  def create
    tweet = current_user.tweets.build(params[:tweet])
    tweet.message = tweet.message[0..140]
    tweet.created_at = Time.now()
   # render :text => tweet.valid?
  #  render :text => tweet.inspect

    tweet.save!
    redirect_to root_path

  end

    def destroy
      @tweet = Tweet.find(params[:id])
      @tweet.destroy



    end

end
