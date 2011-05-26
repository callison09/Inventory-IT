class RootController < ApplicationController
  def index
  	if cookies[:theme1] then
  		@theme = cookies[:theme1]
  	else
  		@theme = "dark"
  	end

  	@number_of_computers = Computer.all.count
  	@new_computers = Computer.sort(:created_at).limit(10)
  end

  def find
  end
  def theme
  	theme = params[:theme1]
	cookies[:theme1] = { 
			:value => theme[:ts], 
			:path => '/', 
			:expires => 1412.years.from_now }
  	redirect_to "/"
  end
end
