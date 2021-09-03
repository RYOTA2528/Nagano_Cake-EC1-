class Admin::HomesController < ApplicationController
before_action :authenticate_admin!
  def top

   @order = Order.new
   @orders = Order.all
   @orders = Order.paginate(page: params[:page], per_page: 5)
  end

end
