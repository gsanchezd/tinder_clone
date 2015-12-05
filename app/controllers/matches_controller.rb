class MatchesController < ApplicationController
  def index
    @matches = current_user.matches
  end
end
