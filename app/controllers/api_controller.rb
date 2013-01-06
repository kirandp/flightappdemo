class ApiController < ApplicationController

	def login
		@user = User.find_by_username(params[:username])
	    if (@user && @user.valid_password?(params[:password]))
        	@response = "AUTHORIZED"
        else
        	@response = "UNAUTHORIZED"
        end  	
        respond_to do |format|
        	format.json {render :json=>[:response=>@response,:user_id=>@user.id]}	
        end 	
    end		

   def signup
   	 @user = User.new(params[:user])
        if (params[:user][:email].nil? || params[:user][:password].nil? || params[:user][:username].nil? || params[:user][:password_confirmation].nil?)
           @response = "ERROR"
        else
	        if (@user.save )
	        	@response = "REGISTERED"
	        else
	        	@response = "ERROR"
	        end  
        end
        respond_to do |format|
        	format.json {render :json=>[:response=>@response]}	
        end 	
   end
   
   def get_all_flights
   	@user = User.find(params[:user_id])
   	@flights = @user.flights
   	   respond_to do |format|
        	format.json {render :json=>[:response=>@flights]}	
       end 
   end	

   def add_flight
     @flight = Flight.new(params[:flight])
      if (@flight .save )
	        	@response  = "CREATED"
	        else
	        	@response  = "ERROR"
	  end 
	  respond_to do |format|
        	format.json {render :json=>[:response=>@response]}	
       end  
   end	

   def add_flight_time
      if(params[:fltime].nil? || params[:time_type].nil? || params[:id].nil? )
        @response  = "ERROR"
      else
      	@flight= Flight.find(params[:id])
   	    @time_type = params[:time_type]
		     case @time_type 
		       when "in"
		       		 @flight.in = params[:fltime]
		       when "out"
		       		 @flight.out = params[:fltime]
		       when "on"	
		       		 @flight.on = params[:fltime]	
		       when "off"	
		       		 @flight.off = params[:fltime]	
		     end
		   	 if (@flight .save )
			        	@response  = "UPDATED"
			        else
			        	@response  = "ERROR"
			  end 
      end	
	  respond_to do |format|
        	format.json {render :json=>[:response=>@response]}	
      end  
   end
 end
