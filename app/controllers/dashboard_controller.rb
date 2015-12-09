class DashboardController < ApplicationController
  def index

    @my_contacts = current_user.contacts.order("name ASC")

    #Create global contact collection
    @names_for_exclude=[]
    @my_contacts.each do |contact|
      @names_for_exclude.push(contact.name)
    end

    #remove items in my contacts and duplicates
    @all_contacts = Contact.select(:name).distinct
    @all_contacts = @all_contacts.where.not({:name=>@names_for_exclude}).order("name ASC")


    @moves = current_user.moves.order("created_at DESC")

  end
end
