class ComputerController < ApplicationController
	layout nil

	def index
		@computer = Computer.all
	end

	def new
		@computer = Computer.new
	end

	def create

		@computer = Computer.new(params[:computer])
		@computer.softwares.build(params[:computer][:software])
		@computer.save!

		redirect_to '/computer' and flash[:warn] = nil

	end

	def update
		
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
