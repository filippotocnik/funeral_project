class CalendarController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  include OpenWeather

  def index
    @events = Event.all 
    @today = Date.today
    @temperatures = OpenWeather.temperatures
    @forecasts = OpenWeather.forecasts
    @icons = OpenWeather.icons
  end
end
