class MatchesController < ApplicationController
  before_action :authenticate_user!
  def index
    @matches = current_user.matches
  end
end
