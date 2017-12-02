module OpenWeather

  app_id = ENV["APP_ID"]
  @response = HTTParty.get("http://api.openweathermap.org/data/2.5/forecast/daily?id=3239318&units=metric&cnt=14&APPID=#{app_id}")  

  def self.temperatures
    @temperatures = []
    14.times do |item|
      temperature = @response['list'][item]['temp']['day'].to_i
      @temperatures.push(temperature)
    end
    return @temperatures
  end

  def self.forecasts
    @forecasts = []
    14.times do |item|
      forecast = @response['list'][item]['weather'][0]['main']
      @forecasts.push(forecast)
    end
    return @forecasts
  end

  def self.icons
    @icons = []
    14.times do |item|
      icon = @response['list'][item]['weather'][0]['icon']
      @icons.push(icon)
    end
    return @icons
  end
  
end