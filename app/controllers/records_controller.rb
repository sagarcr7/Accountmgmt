class RecordsController < ApplicationController
	def index
		@records= Record.all
	 	@balance= Record.balance
		@debt= Record.debt
	 	@total= Record.total
	 end

	 def create
	@records= Record.create(record_params)
	if @records.valid?
		flash[:success] = "Your record has been created!"
		redirect_to root_path
 	else
		flash[:alert] = "sorry! there has been an error!"
		render :new
		end
	end

	def edit
		 @record = Record.find(params[:id])
	end
	def update
		@record = Record.find(params[:id])
			if @record.update(record_params)
				flash[:success] = "The record has been updated!"
				redirect_to root_path
			else
				flash[:alert] = "Sorry! there has been an error!"
				redirect_to edit_record_path(params[:id])
    		end
	end

	def destroy
		@record=Record.find(params[:id])
		@record.destroy
		flash[:success] = "The record was successfully deleted!"
		redirect_to root_path
	end

	 private
	def record_params
		params.require(:record).permit(:title, :date , :amount)
	end
end
