class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name

    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :last_name
  end

  def get_cs_number (contact_name)
    require 'json'
    require 'open-uri'

    url_ip="https://api.ipify.org?format=json"
    raw_data_ip=open(url_ip).read
    parsed_data_ip=JSON.parse(raw_data_ip)
    ip=parsed_data_ip["ip"]

    url_location="http://ip-api.com/json/"+ip
    raw_data_location=open(url_location).read
    parsed_data_location=JSON.parse(raw_data_location)
    city=parsed_data_location["city"]


    key=ENV['geo_key']
    url_id="http://api2.yp.com/listings/v1/search?searchloc="+city+"
    &term="+CGI::escape(contact_name)+"&format=json&key="+key+"&sort=name&listingcount=1"
    raw_data=open(url_id).read
    parsed_data=JSON.parse(raw_data)
    num_results=parsed_data["searchResult"]["metaProperties"]["listingCount"].to_i
    if num_results > 0
      number=parsed_data["searchResult"]["searchListings"]["searchListing"][0]["phone"]
      category=parsed_data["searchResult"]["searchListings"]["searchListing"][0]["primaryCategory"]
    else
      number=nil
      category=nil
    end
    results={:number=>number, :city=>city, :category=>category, :num_results=>num_results}
    return results
  end


end
