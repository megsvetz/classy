 class CatsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_cat, only: [:update, :edit, :destroy, :show]

  def index
    @cats = Cat.all
  end #index endtag

  def show
    
    @items = Item.where(cat_id: params[:id])
    # unless(@items == @cat.id)
    #   redirect_to cats_path
    # end
  end #show endtag

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.create(cat_params)
    if @cat.save 
      flash[:notice]= "Category created successfully!"
      redirect_to(cats_path)
    else
      flash[:error]= "Category creation failed!"
      # raise "the roof"
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
    end
    redirect_to(cats_path)
  end #destroy endtag

  private

  def cat_params
    params.require(:cat).permit(:name)
  end

  def find_cat
    @cat = Cat.find_by(id: params[:id]) 
    unless @cat
      render(text: "you killed it", status: :not_found)
    end
  end #find_cat endtag
end
  