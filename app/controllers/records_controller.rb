class RecordsController < ApplicationController
	def index
		@records= Record.all
	 	@balance= Record.balance
		@debt= Record.debt
	 	@total= Record.total
	 end

	 def create
	@record= Record.create(record_params)
	if @record.valid?
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
		 @record.update(record_params)
		if @record.valid?
				redirect_to root_path
			else
				render :edit
    		end
	end

	def destroy
		@record=Record.find(params[:id])
		@record.destroy
		redirect_to root_path
	end

	 private

	def record_params
		params.require(:record).permit(:title, :date , :amount)
	end
end
