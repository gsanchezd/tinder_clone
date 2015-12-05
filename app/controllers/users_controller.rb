class UsersController < ApplicationController
  def complete_profile
    @user = current_user
    3.times { @user.photos.build() }
  end

  def save_profile
    current_user.update_attributes(user_params)
    redirect_to interactions_index_path
  end

  def user_params
    params.require(:user).permit(:photos_attributes => [:photo])
  end

end
