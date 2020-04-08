class InterventionController < ApplicationController
  skip_before_action :verify_authenticity_token
  def building
    if params[:customer].present?
        @building = Building.where(customer_id:params[:customer])
    else
        @building = Building.all
    end
    respond_to do |format|
        format.json {
            render json: {building: @building}
        }
    end
  end

  def battery
    if params[:building].present?
        @battery = Battery.where(building_id:params[:building])
    else
        @battery = Battery.all
    end
    respond_to do |format|
        format.json {
            render json: {battery: @battery}
        }
    end
  end

  def column
    if params[:building].present?
        @column = Column.where(battery_id:params[:battery])
    else
        @column = Column.all
    end
    respond_to do |format|
        format.json {
            render json: {column: @column}
        }
    end
  end

  def employee
    if params[:building].present?
        @employee = Employee.where(column_id:params[:column])
    else
        @employee = Employee.all
    end
    respond_to do |format|
        format.json {
            render json: {employee: @employee}
        }
    end
  end


   def create
puts"im in the create def of @intervention controller-----------------------------------------------------------------"
    @intervention = Intervention.new
        @intervention.author_id = "current_employee"
        @intervention.customer_id = params[:customerID]
        @intervention.building_id = params[:buildingID]
        @intervention.battery_id = params[:batteryID]
        @intervention.column_id = params[:columnID]
        @intervention.elevator_id = params[:elevatorID]
        @intervention.employee_id = params[:employeeID]
        @intervention.intervention_start_time = params[:start_of_intervention]
        @intervention.intervention_end_time = params[:end_of_intervention]
        @intervention.result = "Incompleted"
        @intervention.report = ""
        @intervention.status = "pending"

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












