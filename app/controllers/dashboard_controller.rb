class DashboardController < ApplicationController
  def index
    @my_contacts = current_user.contacts
    @all_contacts = Contact.all - current_user.contacts
    @moves = current_user.moves
  end
end
