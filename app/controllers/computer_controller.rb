class ComputerController < ApplicationController
	layout nil

	def index
		redirect_to "/"
	end

	def new
		@computer = Computer.new
	end

	def create

		@computer = Computer.new(params[:computer])
		@computer.softwares.build(params[:computer][:software])
		@computer.save!

		redirect_to '/'

	end

	def update
		@CompID = params[:id]
		@changes = params[:computer]
		@computer = Computer.first(:id => @CompID)
		if @computer.update_attributes!(@changes) then
			redirect_to '/'
		end
	end
	
	def show
		@computer = Computer.where(:name => params[:id]).first
	end

	def edit
		@computer = Computer.where(:name => params[:id]).first
	end

	def destroy
		
	end

end
