class HomeController < ApplicationController
  allow_unauthenticated_access only: [ :index ]
  before_action :resume_session, only: [ :index ]

  def index
    if Current.user.present?
      @locations = Location.order(rating: :desc)
      @locations = @location.from_user(Current.user) if params[:filter] == "mine"
    else
      @locations = Rails.cache.fetch("top_locations") do
        ::LocationRepository.top_3
      end
    end
  end
end
