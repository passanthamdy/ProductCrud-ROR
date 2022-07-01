class ProductsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret"

  
  def index
    @products=Product.all
  end
  def show 
    @product=Product.find(params[:id])
  end 
  def new 
    @product=Product.new 
  end 
  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to @product
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(products_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def products_params
    params.require(:product).permit(:name, :descripton,:price,:image,:user_id)
  end

end
