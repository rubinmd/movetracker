class MovesController < ApplicationController
  def index
    @moves = Move.all
  end

  def show
    @move = Move.find(params[:id])
  end

  def new
    @move = Move.new
  end

  def create
    @move = Move.new
    @move.user_id = params[:user_id]
    @move.notes = params[:notes]
    @move.updated_phone = params[:updated_phone]
    @move.updated_email = params[:updated_email]
    @move.updated_address = params[:updated_address]
    @move.name = params[:name]
    if @move.save
      redirect_to "/moves", :notice => "Move created successfully."

    @contacts = Contact.all
    @contacts.each do |contact|
      if @move.updated_phone == true && contact.has_phone == true
        @sl=StaleListing.new
        @sl.out_of_date_phone=true
        @sl.move_id=@move.id
        @sl.contact_id=contact.id
        @sl.save
      end
      if @move.updated_address == true && contact.has_address == true
        @sl=StaleListing.new
        @sl.out_of_date_address=true
        @sl.move_id=@move.id
        @sl.contact_id=contact.id
        @sl.save
      end
        if @move.updated_email == true && contact.has_email == true
        @sl=StaleListing.new
        @sl.out_of_date_email=true
        @sl.move_id=@move.id
        @sl.contact_id=contact.id
        @sl.save
      end
    end
    else
      render 'new'
    end
  end

  def edit
    @move = Move.find(params[:id])
  end

  def update
    @move = Move.find(params[:id])
    @previously_had_address=@move.updated_address
    @previously_had_phone=@move.updated_phone
    @previously_had_email=@move.updated_email

    @move.user_id = params[:user_id]
    @move.notes = params[:notes]
    @move.updated_phone = params[:updated_phone]
    @move.updated_email = params[:updated_email]
    @move.updated_address = params[:updated_address]
    @move.name = params[:name]

    #Edit existing stale_listings rather than nuking to preserve completed updates
    #Step 1: Delete stale_listings that no longer apply
    if @move.save
      @move.stale_listings.each do |listing|
        if @move.updated_phone == nil && listing.out_of_date_phone == true
          listing.destroy
        end
        if @move.updated_email == nil && listing.out_of_date_email == true
          listing.destroy
        end
        if @move.updated_address == nil && listing.out_of_date_address == true
          listing.destroy
        end
      end

      #Step 2: Add new stale_listings that now apply
      Contact.all.each do |contact|
        if @previously_had_phone == nil && @move.updated_phone == true && contact.has_phone == true
          @sl=StaleListing.new
          @sl.out_of_date_phone=true
          @sl.move_id=@move.id
          @sl.contact_id=contact.id
          @sl.save
        end
        if @previously_had_address == nil && @move.updated_address == true && contact.has_address == true
          @sl=StaleListing.new
          @sl.out_of_date_address=true
          @sl.move_id=@move.id
          @sl.contact_id=contact.id
          @sl.save
        end
          if @previously_had_email == nil && @move.updated_email == true && contact.has_email == true
          @sl=StaleListing.new
          @sl.out_of_date_email=true
          @sl.move_id=@move.id
          @sl.contact_id=contact.id
          @sl.save
        end
      end


      redirect_to "/moves", :notice => "Move updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @move = Move.find(params[:id])

    @move.destroy

    redirect_to "/moves", :notice => "Move deleted."
  end
end
