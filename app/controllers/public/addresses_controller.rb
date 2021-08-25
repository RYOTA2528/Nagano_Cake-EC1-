class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
    redirect_to addresses_path(@addresses)
    flash[:notice]='You have updated Address information  successfully.'
    else
    @addresses = Address.all
    render :index
    end
  end


  def edit
    @address = Address.find(params[:id])
  end



  def update
    @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
    if @address.update(address_params)
    redirect_to addresses_path(@addresses)
    flash[:notice]='You have updated Address information  successfully.'
    else
     render :edit
    end
  end

  def destroy
     address =Address.find(params[:id])
     address.destroy
     redirect_to addresses_path
     flash[:notice]='Address was successfully destroyed.'
  end

 private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address, :customer_id)
  end

end