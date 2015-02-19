class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  respond_to :html

  # GET /items
  # GET /items.json
  def index
    @items = Item.where(availability: true)
    respond_with(@item)
  end

  # GET /items/1
  # GET /items/1.json
  def show
    respond_with(@item)
  end

  # GET /items/new
  def new
    @item = Item.new
    respond_with(@item)
  end

  # GET /items/1/edit
  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.save
    respond_with(@item)
  end

  def update
    @item.update(item_params)
    respond_with(@item)
  end

  def destroy
    @item.destroy
    respond_with(@item)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :seller, :description, :price, :availability)
    end
end
