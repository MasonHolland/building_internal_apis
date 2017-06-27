class Api::V1::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    # render(json: Order.find(params[:id]))
  end

end
