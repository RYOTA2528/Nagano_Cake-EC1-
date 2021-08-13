class Admin::CustomersController < ApplicationController

  def index
  @Customers = Customer.all
  end

  def show
    @customer = Costomer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
   if @customer.update(customer_params)
    redirect_to admin_customer_path(@customer)
    flash[:notice]='You have updated Customer information  successfully.'
   else
    render :edit
   end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end
end

