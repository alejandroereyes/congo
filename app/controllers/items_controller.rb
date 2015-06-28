class ItemsController < ApplicationController

  def index
    @items = Item.all.paginate(:page => params[:page], :per_page => 15)
  end

  def show
    begin
      @item = Item.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
      redirect_to :back, flash[:alert] = 'Record not Found', status: 404
    end
  end
end
