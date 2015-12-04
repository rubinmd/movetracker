class DashboardController < ApplicationController
  def index
    @contacts = current_user.contacts
    @moves = current_user.moves
  end
end
