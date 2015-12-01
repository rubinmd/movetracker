class StaleListingsController < ApplicationController
  def index
    @stale_listings = StaleListing.all
  end

  def show
    @stale_listing = StaleListing.find(params[:id])
  end

  def new
    @stale_listing = StaleListing.new
  end

  def create
    @stale_listing = StaleListing.new
    @stale_listing.out_of_date_address = params[:out_of_date_address]
    @stale_listing.out_of_date_email = params[:out_of_date_email]
    @stale_listing.out_of_date_phone = params[:out_of_date_phone]
    @stale_listing.move_id = params[:move_id]
    @stale_listing.contact_id = params[:contact_id]

    if @stale_listing.save
      redirect_to "/stale_listings", :notice => "Stale listing created successfully."
    else
      render 'new'
    end
  end

  def edit
    @stale_listing = StaleListing.find(params[:id])
  end

  def update
    @stale_listing = StaleListing.find(params[:id])

    @stale_listing.out_of_date_address = params[:out_of_date_address]
    @stale_listing.out_of_date_email = params[:out_of_date_email]
    @stale_listing.out_of_date_phone = params[:out_of_date_phone]
    @stale_listing.move_id = params[:move_id]
    @stale_listing.contact_id = params[:contact_id]

    if @stale_listing.save
      redirect_to :back, :notice => "Stale listing updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @stale_listing = StaleListing.find(params[:id])

    @stale_listing.destroy

    redirect_to :back, :notice => "Stale listing deleted."
  end
end
