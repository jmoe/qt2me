class ApplicationController < ActionController::Base  
  protect_from_forgery

  def track_page_view(title, url)
  	if(Rails.env.production? || Rails.env.staging?)
	    tracker = Gabba::Gabba.new(GA_TRACKER_ID, GA_TRACKER_DOMAIN)
	    tracker.identify_user(cookies[:__utma]) unless cookies[:__utma].blank?
	    tracker.page_view(title, url)
	 end
  end
end
