class RecordsController < ApplicationController
	def index
		@records= Record.all
	 	@balance=Record.balance
		@debt=Record.debt
	 	@total=Record.total
	 end
end
