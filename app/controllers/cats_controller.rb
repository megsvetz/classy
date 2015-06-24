class CatsController < ApplicationController
  before_action find_cat, only: [:update, :edit, :destroy, :show]

  def index
    @cats = Cat.all
  end #index endtag

  def show
  end

  def new
    @cat = Cat.new
  end

  def create
    if @cat.save(cat_params)
      flash[:notice]= "Category created successfully!"
      redirect_to(cats_path)
    else
      flash[:error]= "Category creation failed!"
      render :new
    end
  end # Create endtag

  def edit
  end

  def update
    if @cat.update(cat_params)
      flash[:notice]= "Successfully updated!"
      redirect_to(cats_path)
    else
      flash[:error]= "Update Failed!"
      render :edit
    end
  end #update endtag

  def destroy
    if @cat.destroy
      flash[:alert]="Category deleted!"
    else
      flash[:error]="Category deletion failed!"
  end

  private

  def cat_params
    params.require(:cat).permit(:name)
  end

  def find_cat
    @cat = Cat.find_by(:id params[:id])
  end

end
