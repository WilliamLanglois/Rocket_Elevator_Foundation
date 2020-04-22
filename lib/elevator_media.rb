require "open-uri"
require 'open_weather'
require 'mysql2'

class Streamer

    def self.add(input)
        input
    end
    def self.getcontent()
        nil
    end
    def self.realcontent()
        "app/assets/images/rocket.png"
    end
    def self.muchocontent()
        open("https://s3.amazonaws.com/com.twilio.prod.twilio-docs/images/test.original.jpg") do |image|
            File.open("./test.jpg", "wb") do |file|
                file.write(image.read)
            end
        end
    end
    def self.elevatorcontent()
        open("https://www.brickunderground.com/sites/default/files/styles/blog_primary_image/public/blog/images/iStock-1150510276.jpg") do |image|
            File.open("./elevator_photo.jpg", "wb") do |file|
                file.write(image.read)
            end
        end
    end
    def self.temperature()
        options = { units: "metric", APPID: '802152fb9efde252021d2686603098f9' }
        # get current weather by city name
         info = OpenWeather::Current.city("Québec, CA", options)
         puts info
         info
    end
    def self.gettingSomething() 
        client = Mysql2::Client.new(:host => "codeboxx.cq6zrczewpu2.us-east-1.rds.amazonaws.com", :username => "codeboxx", :password => "Codeboxx1!", :database => "WilliamLanglois")
        results = client.query("
            SELECT city FROM buildings, addresses WHERE buildings.address_id = addresses.id
            ORDER BY RAND()
            LIMIT 1")
        
        puts results.first
        results
    end
end





