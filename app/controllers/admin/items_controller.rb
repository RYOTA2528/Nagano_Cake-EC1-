class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
   @genres = Genre.all
   @item = Item.new(item_params)
   if @item.save
   redirect_to admin_item_path(@item)
   else
   # 作成に失敗した場合、 /items/new に戻してバリデーションエラーを表示する
   render :new
   # view 側で、 @book.errors を使ってエラーを表示する。
   end
  end

  def index
   @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @genre =@item.genre
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    redirect_to admin_item_path(@item)
    flash[:notice]='You have updated Item infomation successfully.'
    else
    render :edit
    end
  # 今回、テスト&アプリケーションのにもif分によるelseでの遷移先の記載・指定がないため敢えてif分で記載しない。
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :genre_id, :price, :is_active)
  end

end
