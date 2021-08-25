class Public::CartItemsController < ApplicationController

 def create
   @cart_item = CartItem.new
   # @cart_item.customer_id = current.customer_id
   @cart_item = Item.find_by(params[:amount])
   if @cart_item.save
   redirect_to cart_items_path(@cart_item)
   else
   @item = item_id
   # 作成に失敗した場合、 /items/new に戻してバリデーションエラーを表示する
   render 'public/items/show'
   # view 側で、 @book.errors を使ってエラーを表示する。
   end
 end

 def index
   @items = Item.all
   @cart_items = CartItem.all
 end

 def update
  @cart_item = CartItem.find(params[:id])
  if @cart_item.update(cart_item_params)
   redirect_to cart_item_path(@cart_item)
   flash[:notice]='You have updated CartItems infomation successfully.'
  else
   render :index
  end
 end

 def destroy
   cart_item =CartItem.find(params[:id])
   cart_item.destroy
   redirect_to cart_item_path
   flash[:notice]='Address was successfully destroyed.'
 end

 def destroy_all
  CartItem.destroy_all
  current_user.cart_items.destroy_all
  redirect_to cart_items_path
 end

private
def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
end

end
