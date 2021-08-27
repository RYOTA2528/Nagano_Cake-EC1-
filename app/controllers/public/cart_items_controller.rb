class Public::CartItemsController < ApplicationController

 def create
   @cart_item = CartItem.new(cart_item_params)
   @cart_item.customer_id = current_customer.id
  if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
  @cart = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
  @sum = @cart.amount + params[:cart_item][:amount].to_i
  @cart.update(amount:@sum)
  else
  @cart_item.save
  end
   redirect_to cart_items_path
 end


 def index
   @sum = 0
   @cart_items = CartItem.all
 end

 def update

  @cart_item = CartItem.find(params[:id])
  if @cart_item.update(cart_item_params)
   redirect_to cart_items_path(@cart_items)
   flash[:notice]='You have updated CartItems infomation successfully.'
  else
   render :index
  end
 end

 def destroy
   cart_item =CartItem.find(params[:id])
   cart_item.destroy
   redirect_to cart_items_path
   flash[:notice]='Address was successfully destroyed.'
 end

 def destroy_all
  CartItem.destroy_all
  current_customer.cart_items.destroy_all
  redirect_to cart_items_path
 end

private
def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
end

end
