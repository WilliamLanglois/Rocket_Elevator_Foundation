require "open-uri"
require 'open_weather'
require 'mysql2'
require'pg'

class Streamer

# ------------------------------------------ FIRST TEST --------------------------------------------------------
    def self.add(input)
        input
    end
# ------------------------------------------ GETTING AN IMAGE FROM THE APP --------------------------------------------------------
    def self.realcontent()
        "app/assets/images/rocket.png"
    end
# ------------------------------------------ GETTING AN IMAGE FROM INTERNET 1 --------------------------------------------------------
    def self.muchocontent()
        open("https://s3.amazonaws.com/com.twilio.prod.twilio-docs/images/test.original.jpg") do |image|
            File.open("./test.jpg", "wb") do |file|
                file.write(image.read)
            end
        end
    end
# ------------------------------------------ GETTING AN IMAGE FROM INTERNET 2 --------------------------------------------------------
    def self.elevatorcontent()
        open("https://www.brickunderground.com/sites/default/files/styles/blog_primary_image/public/blog/images/iStock-1150510276.jpg") do |image|
            File.open("./elevator_photo.jpg", "wb") do |file|
                file.write(image.read)
            end
        end
    end
# ------------------------------------------ GETTING TEMPERATURE --------------------------------------------------------
    def self.temperature()
        options = { units: "metric", APPID: '802152fb9efde252021d2686603098f9' }
        # get current weather by city name
         info = OpenWeather::Current.city("Québec, CA", options)
         return "The prevision for Quebec city today is #{info["weather"]}"
    end
# ------------------------------------------ GETTING RANDOM BUILDING CITY --------------------------------------------------------
    def self.gettingRandomCityFromMYSQL() 
        client = Mysql2::Client.new(:host => "codeboxx.cq6zrczewpu2.us-east-1.rds.amazonaws.com", :username => "codeboxx", :password => "Codeboxx1!", :database => "WilliamLanglois")
        results = client.query("
            SELECT city FROM buildings, addresses WHERE buildings.address_id = addresses.id
            ORDER BY RAND()
            LIMIT 1")
        
        return "Do you know that we have multiple elevators at #{results.first} city?"
    end
# ------------------------------------------ CONNECTION TO POSTGRES DB --------------------------------------------------------
    def self.gettingBusinessNameFromPG()
        conn = PG.connect("host=codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com port=5432 dbname=WilliamLanglois user=codeboxx password=Codeboxx1!");
        data = conn.exec("SELECT business_name FROM dimcustomers")
        
        # puts data.first
         return "Did you know that #{data.first} use our elevators?"
    end
# ------------------------------------------ FUN FACT (COUNT OF CUTSOMER, ELEVATORS AND BUILDINGS) --------------------------------------------------------
    def self.gettingFunFact() 
        client = Mysql2::Client.new(:host => "codeboxx.cq6zrczewpu2.us-east-1.rds.amazonaws.com", :username => "codeboxx", :password => "Codeboxx1!", :database => "WilliamLanglois")
        results_employees = client.query("
            SELECT * FROM employees
            ")
        results_elevators = client.query("
            SELECT * FROM elevators
            ")
        results_buildings = client.query("
            SELECT * FROM buildings
            ")
        
        # puts results_employees.count
        # puts results_elevators.count
        # puts results_buildings.count
        return "There is acutally #{results_employees.count} employees working on #{results_elevators.count} elevators in #{results_buildings.count} differents buildings!"
    end

# ------------------------------------------ GETTING SUPERHERO --------------------------------------------------------
        def self.getsuperhero()
            testurl =  Net::HTTP.get(URI("https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/id/28.json"))
                superhero = JSON.parse(testurl)
                # puts superhero["name"]
                return superhero["name"]
        end
# ------------------------------------------ GETTING CONTENT --------------------------------------------------------
    def self.getcontent()
        puts "<div> #{temperature()} </div>"
        puts "<div> #{gettingBusinessNameFromPG()} </div>"
        puts "<div> #{gettingRandomCityFromMYSQL()} </div>"
        puts "<div> #{gettingFunFact()} </div>"
        puts "<div> #{getsuperhero()} </div>"
        return "<div> #{temperature()} </div>"
    end
end





