class Api::V1::OrdersController < ApplicationController

  def index
    render(json: Item.all)
  end

  def show
    render(json: Item.find(params[:id]))
  end

end
