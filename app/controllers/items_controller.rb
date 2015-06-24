class ItemsController < ApplicationController
  before_action find_item only: [:edit, :update, :show, :destroy]
  
  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    if @item.save(item_params)
      flash[:notice]="Item was created succesfully!"
      redirect_to(items_path)
    else
      flash[:error]="Item was not created."
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update
      flash[:notice]="Item was updated successfully!"
      redirect_to(items_path)
    else
      flash[:error]="Item was not updated."
      render :edit
    end
  end

  def destroy
    if @item.destroy
      flash[:alert]="Item was successfully deleted!"
    else
      flash[:error]="Item was not deleted."
    end
    redirect_to(items_path)
  end

private
  def item_params
    params.require(:item).permit(:name, :price, :description, :cat_id)
  end

  def find_item
    @item = Item.find_by(:id params[:id])
  end
end
