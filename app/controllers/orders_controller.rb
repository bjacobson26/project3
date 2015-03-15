class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
  end

  def create
    @order = Order.new
    @order.user_id = current_user.id
    @order.product_id = params[:product_id].to_i
    @user = current_user





    if @order.save

      puts "====================================="
      puts "user id = #{@user.id} and order id = #{@order.id}"
      puts "====================================="
      UserMailer.order_confirmation(@user.id, @order.id).deliver


      # flash[:notice] = "Order successfully created"

      Stripe.api_key = ENV['STRIPE_API_KEY']

      @amount = @order.product.unit_price.to_i * 100



      customer = Stripe::Customer.create(
          :email => 'example@stripe.com',
          :card  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => @amount,
          :description => 'Rails Stripe customer',
          :currency    => 'usd'
      )

      redirect_to order_path(@order)
    else
      puts "==========================================================================="
      puts "Order fucked"
      puts "==========================================================================="
    end
  end

  def show

    @order = Order.find(params[:id])
  	

  end

  def edit
  end
end
