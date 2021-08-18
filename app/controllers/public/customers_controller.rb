class Public::CustomersController < ApplicationController
# before_action :ensure_correct_customer, only: [:show, :edit, :update]

def show
@customer = current_customer
# @customer = Customer.find(params[:id])
end

def edit
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
