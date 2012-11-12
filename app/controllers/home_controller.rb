class HomeController < ApplicationController

  before_filter :login_required

  def index

    @tweets = current_user.all_tweets

    @last_tweet = current_user.tweets.last
  end

  def show

   @user = User.find_by_username(params[:username])
    @tweets = @user.all_tweets

  end

  def toggle_follow
    @user = User.find_by_username(params[:username])
    if current_user.is_friend? @user
      flash[:notice] = "You are no longer following #{@user.username}"
      current_user.remove_friend(@user)
    else
      current_user.add_friend(@user)
      flash[:notice] = "You are now following #{@user.username}"
    end
    redirect_to user_tweet_path_path



  end
  def toggle_follow_via_ajax
    user = User.find_by_username(params[:username])
    if current_user.is_friend? user
      current_user.remove_friend(user)
    else
      current_user.add_friend(user)
    end
    render :text => user.username



  end

  def following
    @friends = current_user.friends
  end

  def followers
    @followers = current_user.friends_of
  end

  def add_friend
    @user = User.find_by_username(params[:username])
      current_user.add_friend(@user)
      flash[:notice] = "You are now following #{@user.username}"
    end

  def search
    @q = params[:q]
    if @q == ""          #hack incase the user enters a blank field!  sorry.
      @q = " "
    end
    @friends = User.find_by_search_query(@q)

  end



  def remove_friend
    friend = User.find_by_username(params[:username])
      if friend
        flash[:notice] = "You are no longer following #{friend.username}"
        current_user.remove_friend(friend)
        render :text => friend.username
      else
        render :text =>'none'
      end
  end



end

