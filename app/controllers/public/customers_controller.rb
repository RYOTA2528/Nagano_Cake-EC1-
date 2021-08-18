class Public::CustomersController < ApplicationController
before_action :authenticate_customer!

def show
@customer = current_customer
# @customer = Customer.find(params[:id])
end

def edit
 @customer = current_customer
end

def update
end

def unsubscribe
end

def withdraw
end


private

def customer_params
 params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :last_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_deleted)
end

end
