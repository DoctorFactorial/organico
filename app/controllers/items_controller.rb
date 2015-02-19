class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit, :create, :update, :destroy]
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
    authorize! :manage, @item
  end

  def create
    @item = current_user.items.new(item_params)
    @item.save
    respond_with(@item)
  end

  def update
    authorize! :manage, @item
    @item.update(item_params)
    respond_with(@item)
  end

  def destroy
    authorize! :manage, @item
    @item.destroy
    respond_with(@item)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :seller, :description, :price, :availability, :image, :resource)
    end
end
