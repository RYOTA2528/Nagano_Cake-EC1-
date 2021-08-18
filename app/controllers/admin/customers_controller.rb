class Admin::CustomersController < ApplicationController
before_action :ensure_correct_admin, only: [:index, :show, :update]
  def index
  @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
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
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :last_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_deleted)
  end
end

