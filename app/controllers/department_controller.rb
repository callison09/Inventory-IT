class DepartmentController < ApplicationController

  layout :nil

  def index
  end

  def new
    @dpt = Department.new
  end

  def create
    @string2 = "" #Initialize String
    @dpt = Department.new(params[:department]) #build new department from incoming parameters

    if @dpt.save
      @string2 = @dpt.name + " - " + @dpt.location
      @status = 200
    else
      @dpt.errors.full_messages.each {|x| @string2 << "<br /><span style='color: red;'>Error:&nbsp;</span><strong>#{x}</strong>" } #Add each error message to the string
      @status = 500 #Set status
    end
    
    respond_to {|f|
      f.html { render :text => @string2, :status => @status }
    }
  end

  def update
  end

  def edit
  end

  def show
  end

  def get_location_departments
    departments = "<option></option>" #Build first string w/ blank option first
    x = params[:location] #Fetch incoming parameter
    tmp = Department.where(:location => "#{x}") #Find all departments with location matching incoming parameter
    for t in tmp #Create options based on data retrieval
      departments << "<option>" + t.name + "</option>"
    end
    render :text => departments #Output options string for select box
  end


end
