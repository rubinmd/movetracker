class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
    @notes = Note.where({:user_id=>current_user.id, :contact_id=>@contact.id})[0].content
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new
    @contact.user_id = params[:user_id]
    @note_text = params[:notes]
    @contact.has_phone = params[:has_phone]
    @contact.has_email = params[:has_email]
    @contact.has_address = params[:has_address]
    @contact.name = params[:name]
    @exclude=params[:exclude]

    if @contact.save
      redirect_to "/contacts", :notice => "Contact created successfully."

      n=Note.new
      n.user_id=current_user.id
      n.contact_id=@contact.id
      n.content=@note_text
      n.save

      #fix this later
      if @exclude == "1"
        puts "huh?"

      else

        Move.all.each do |move|
          if @contact.has_address == true && move.updated_address == true
            sl = StaleListing.new
            sl.out_of_date_address = true
            sl.contact_id=@contact.id
            sl.move_id=move.id
            sl.save
          end
          if @contact.has_phone == true && move.updated_phone == true
            sl = StaleListing.new
            sl.out_of_date_phone = true
            sl.contact_id=@contact.id
            sl.move_id=move.id
            sl.save
          end
          if @contact.has_email == true && move.updated_email == true
            sl = StaleListing.new
            sl.out_of_date_email = true
            sl.contact_id=@contact.id
            sl.move_id=move.id
            sl.save
          end
        end
      end
    else
      render 'new'
    end


  end

  def edit
    @contact = Contact.find(params[:id])
    @notes = Note.where({:user_id=>current_user.id, :contact_id=>@contact.id})[0].content
  end

  def update
    @contact = Contact.find(params[:id])
    @previously_had_address=@contact.has_address
    @previously_had_phone=@contact.has_phone
    @previously_had_email=@contact.has_email
    @contact.user_id = params[:user_id]
    @notes = params[:notes]
    @contact.has_phone = params[:has_phone]
    @contact.has_email = params[:has_email]
    @contact.has_address = params[:has_address]
    @contact.name = params[:name]

    #Update stale listings if a contact changes. Adding a contact method adds new stale listings to existing moves. Removing a contact method deletes existing stale listings referencing it.

    #Step 1: Add new stale listings when a new contact method is added
    if @contact.save

      n = Note.where({:user_id=>current_user.id, :contact_id=>@contact.id})[0]
      n.content=@notes
      n.save

      Move.all.each do |move|
        if @previously_had_email==nil && @contact.has_email == true && move.updated_email == true
          sl=StaleListing.new
          sl.out_of_date_email=true
          sl.contact_id=@contact.id
          sl.move_id=move.id
          sl.save
        end
        if @previously_had_address==nil && @contact.has_address == true && move.updated_address == true
          sl=StaleListing.new
          sl.out_of_date_address=true
          sl.contact_id=@contact.id
          sl.move_id=move.id
          sl.save
        end
        if @previously_had_phone==nil && @contact.has_phone == true && move.updated_phone == true
          sl=StaleListing.new
          sl.out_of_date_phone=true
          sl.contact_id=@contact.id
          sl.move_id=move.id
          sl.save
        end
      end

    #Step 2: Remove old listings when a contact method is deleted

    @contact.stale_listings.each do |listing|
      if @previously_had_email==true && @contact.has_email == nil && listing.out_of_date_email == true
        listing.destroy
      end
      if @previously_had_phone==true && @contact.has_phone == nil && listing.out_of_date_phone == true
        listing.destroy
      end
      if @previously_had_address==true && @contact.has_address == nil && listing.out_of_date_address == true
        listing.destroy
      end

    end


      redirect_to "/contacts", :notice => "Contact updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    @note = Note.where({:user_id=>current_user.id, :contact_id=>@contact.id})[0]
    @note.destroy

    redirect_to "/contacts", :notice => "Contact deleted."
  end
end
