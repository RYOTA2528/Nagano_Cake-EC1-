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
 @customer = current_customer
 if @customer.update(customer_params)
 redirect_to customers_my_page_path(@customer)
 flash[:notice]='You have updated Customer infomation successfully.'
 else
 render :edit
 end
end

def unsubscribe
 @customer = current_customer
end

def withdraw
 @customer = current_customer
 @customer.update(is_deleted: true)
 # 今回はtrue＝退会です。
 reset_session
 redirect_to root_path
 # 退会ユーザーの指定先はなかったため、root_pathにしてます。
end


private

def customer_params
 params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :last_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_deleted)
end

end
