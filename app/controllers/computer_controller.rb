class ComputerController < ApplicationController
	layout nil
	#respond_to :html, :xml, :json

	def index
		render :nothing => true
	end

	def new
		@computer = Computer.new
	end

	def create
		
		@computer = Computer.new(params[:computer])

		@computer.softwares.build(params[:software])

		if @computer.save
			@string2 = @computer.name + " - " + @computer.sn
			@status = 200
		else
			@computer.errors.full_messages.each {|x| @string2 << "<br /><span style='color: red;'>Error:&nbsp;</span><strong>#{x}</strong>" }
			@status = 500
		end
		
		respond_to {|f|
			f.html { render :text => @string2, :status => @status }
		}

	end

	def update
		@CompID = params[:id]
		@changes = params[:computer]
		@computer = Computer.first(:id => @CompID)
		if @computer.update_attributes!(@changes) then
			render :nothing =>  true
		else
			render :nothing => true, :status => 404
		end
	end
	
	def show
		@computer = Computer.where(:name => params[:id]).first
	end

	def edit
		@computer = Computer.where(:id => params[:id]).first
		if @computer[:software].nil? then
			@software = nil	
		else
			@software = @computer[:software]
		end
	end

	def destroy
		render :nothing => true
	end

	def add_software
		@time = Time.now.nsec.to_s
		@software = Software.new
		render :partial => 'add_software', :locals => {:software => @software}
	end
end
