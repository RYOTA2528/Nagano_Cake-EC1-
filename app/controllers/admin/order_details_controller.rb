class Admin::OrderDetailsController < ApplicationController

def update
  @order_detail = OrderDetail.find(params[:id])
  @order = @order_detail.order
  if @order_detail.update(order_detail_params)
   if @order_detail.making_status == "in_production"
    @order.update(status: "in_production")
   elsif @order.order_details.where(making_status: "production_complete").count == @order.order_details.count
     @order.update(status: "preparing_delivery")
                #上と下の数が一致したら発送準備中に@orderのstatusカラムを変更
     #   @order.order_details == 5
   end
   redirect_to admin_order_path(@order)
  flash[:notice]='You have updated Order infomation successfully.'
  else
   render :edit
  end
end

private

  def order_detail_params
    params.require(:order_detail).permit(:making_status, :order_id)
  end

end