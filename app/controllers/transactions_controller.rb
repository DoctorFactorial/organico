class TransactionsController < ApplicationController
	def create
		item = Item.find_by!(slug: params[:slug])
		token = params[:stripeToken]

		begin
			charge = Stripe::Charge.create(
				amount: item.price,
				currency: "eur",
				card: token,
				description: current_user.email)
			@sale = item.sales.create!(
				buyer_email: current_user.email)
			redirect_to pickup_url(guid: @sale.guid)
		rescue Stripe::CardError => e
			@error = e
			redirect_to item_path(item), notice: @error
		end
	end

	def pickup
		@sale = Sale.find_by!(guid: params[:guid])
		@item = @sale.item
	end
end