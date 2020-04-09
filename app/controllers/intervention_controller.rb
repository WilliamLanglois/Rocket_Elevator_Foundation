class InterventionController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @customers = Customer.all
    @employees = Employee.all
  end

  def building
    if params[:customer].present?
        buildings = Building.where(customer_id:params[:customer])
        render json: buildings
    end
  end

  def battery
    if params[:building].present?
        batteries = Battery.where(building_id:params[:building])
        render json: batteries
    end
  end

  def column
    if params[:battery].present?
        columns = Column.where(battery_id:params[:battery])
        render json: columns
    end
  end

  def elevator
    if params[:column].present?
        elevators = Elevator.where(column_id:params[:column])
        render json: elevators
    end
  end

   def create
    puts "hey im in the controller----------------------------"
    @intervention = Intervention.new
        @intervention.author_id = current_user.id
        @intervention.customer_id = params['customerID']
        @intervention.building_id = params['buildingID']
        @intervention.battery_id = params['batteryID']
        @intervention.column_id = params['columnID']
        @intervention.elevator_id = params['elevatorID']
        @intervention.employee_id = params['employeeID']
        @intervention.intervention_start_time = nil
        @intervention.intervention_end_time = nil
        @intervention.result = "Incomplete"
        @intervention.report = ""
        @intervention.status = "Pending"

    @intervention.save!
    function_send_ticket();
    redirect_to "/intervention"
  end

  def function_send_ticket
      
    @client = ZendeskAPI::Client.new do |config|
      config.url = "https://williamlanglois.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2
      # Basic / Token Authentication
      config.username = "will_langlois@hotmail.com"
      # config.token = "Zendesk_Token"
      config.token = ENV["Zendesk_Token"]
    end
puts "-----------------------------------------------"
    ZendeskAPI::Ticket.create!(@client,
      :subject => "#{@intervention.author_id} from La compagnie",
      :description => "Create Ticket",
      :comment =>{ :value =>
      "Building Id =  #{@intervention.building_id}
       Battery Id =  #{@intervention.battery_id} 
       Column Id =  #{@intervention.column_id} 
       Elevator Id =  #{@intervention.elevator_id}
       Employee Id #{@intervention.employee_id} 
       Report =  #{@intervention.report} "},
      :type => 'question',
      :priority => "urgent")
  end
end












