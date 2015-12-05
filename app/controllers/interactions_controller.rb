class InteractionsController < ApplicationController
  def index
    # We need all users that havent interacted with the current_user
    @user = current_user.next_user
  end

  def like
    @liked_user = User.find(params[:user_id])
    Interaction.create(user_one: current_user, user_two: @liked_user, like:true)
    redirect_to interactions_index_path
  end

  def dislike
    @liked_user = User.find(params[:user_id])
    Interaction.create(user_one: current_user, user_two: @liked_user, like:false)
    redirect_to interactions_index_path
  end

end
