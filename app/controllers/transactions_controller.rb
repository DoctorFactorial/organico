class TransactionsController < ApplicationController
	def create
		item = Item.find_by!(slug: params[:slug])
		sale = item.sales.create(
			amount: item.price,
			buyer_email: current_user.email,
			seller_email: item.user.email,
			stripe_token: params[:stripeToken])
		sale.process!
		if sale.finished?
			redirect_to pickup_url(guid: sale.guid), notice: "Transacción exitosa"
		else
			redirect_to item_path(item), notice: "Algo salió mal"
		end
	end

	def pickup
		@sale = Sale.find_by!(guid: params[:guid])
		@item = @sale.item
	end
end