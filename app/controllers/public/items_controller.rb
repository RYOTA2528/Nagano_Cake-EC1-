class Public::ItemsController < ApplicationController

def index
 @items = Item.all
end

def show
 @cart_item =CartItem.new
 @item = Item.find(params[:id])
 @genre =@item.genre
end

private

def item_params
 params.require(:item).permit(:name, :image, :introduction, :genre_id, :price, :is_active)
end

end
