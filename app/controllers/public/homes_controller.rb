class Public::HomesController < ApplicationController
def top
  @items = Item.all
  @items = Item.paginate(page: params[:page], per_page: 4)
end

def about
end

end
