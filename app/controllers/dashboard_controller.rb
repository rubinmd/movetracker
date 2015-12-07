class DashboardController < ApplicationController
  def index
    @my_contacts = current_user.contacts
    @names=[]
    @my_contacts.each do |contact|
      @names.push(contact.name)
    end
    @all_contacts = Contact.where.not({:name=>@names})
    @moves = current_user.moves
  end
end
