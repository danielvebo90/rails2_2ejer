class ProductsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @products = Product.all
    render json: @products
  end


  def create
     @product = Product.create(product_params)
     if @product.save
       render json: { product: @product }, status: :created
     else
       render json: { errors: @product.errors }, status: 422
     end
   end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      render json: @product, status: 200
    else
      render json: { errors: @product.errors }, status: 422
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      render json: @product, status: 204
    end

    head :no_content
  end

  private
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
