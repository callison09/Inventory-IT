class DepartmentController < ApplicationController

  layout :nil

  def index
  end

  def new
    @dpt = Department.new
  end

  def create
    @string2 = ""
    @dpt = Department.new(params[:department])

    if @dpt.save
      @string2 = @dpt.name + " - " + @dpt.location
      @status = 200
    else
      @dpt.errors.full_messages.each {|x| @string2 << "<br /><span style='color: red;'>Error:&nbsp;</span><strong>#{x}</strong>" }
      @status = 500
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
    departments = "<option></option>"
    x = params[:location]
    tmp = Department.where(:location => "#{x}")
    for t in tmp
      departments << "<option>" + t.name + "</option>"
    end
    render :text => departments
  end


end
