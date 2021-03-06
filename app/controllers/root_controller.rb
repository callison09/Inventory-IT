class RootController < ApplicationController
  def index
    # Theme chooser
  	if cookies[:theme1] then
  		@theme = cookies[:theme1]
  	else
  		@theme = "dark"
  	end
  end

  def find
    render :layout => false
  end

  def theme
  	theme = params[:theme1]
  	cookies[:theme1] = { 
  			:value => theme[:ts], 
  			:path => '/', 
  			:expires => 1412.years.from_now }
    	redirect_to "/"
  end

  def welcome #Home Tab
    @number_of_computers = Computer.all.count
    @number_of_departments = Department.all.count
    render :partial => "home", :locals => {
        :number_of_computers => @number_of_computers,
        :number_of_departments => @number_of_departments
      }
  end

  def changes #changes tab
    @new_computers = Computer.sort(:created_at.desc).limit(10)
    @recent_changed_computers = Computer.sort(:updated_at.desc).limit(10)
    @new_departments = Department.sort(:created_at.desc).limit(10)
    render :partial => "changes", :locals => {
          :new_computers => @new_computers,
          :recent_changed_computers => @recent_changed_computers,
          :new_departments => @new_departments
        }
  end
end
