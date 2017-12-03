module OpenWeather

  app_id = ENV["APP_ID"]
  @forecast_days = 14
  @response = HTTParty.get("http://api.openweathermap.org/data/2.5/forecast/daily?id=3239318&units=metric&cnt=#{@forecast_days}&APPID=#{app_id}")  

  def self.temperatures
    @temperatures = []
    @forecast_days.times do |item|
      temperature = @response['list'][item]['temp']['day'].to_i
      @temperatures.push(temperature)
    end
    return @temperatures
  end

  def self.forecasts
    @forecasts = []
    @forecast_days.times do |item|
      forecast = @response['list'][item]['weather'][0]['main']
      @forecasts.push(forecast)
    end
    return @forecasts
  end

  def self.icons
    @icons = []
    @forecast_days.times do |item|
      icon = @response['list'][item]['weather'][0]['icon']
      @icons.push(icon)
    end
    return @icons
  end
  
end