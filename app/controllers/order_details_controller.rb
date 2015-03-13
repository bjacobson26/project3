class OrderDetailsController < ApplicationController

  def index
    @orderdetails = OrderDetail.all
  end

  def new
    @orderdetail = OrderDetail.new
  end

  def create
    @orderdetail = User.new(params.require(:orderdetail).permit(:name, :price, :product_id, :user_id))
  end

  def show
  end

  def edit
  end
end
