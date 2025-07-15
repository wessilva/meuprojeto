class Api::V1::ProductsController < Api::V1::BaseController
  # GET /api/v1/products
  def index
    @products = Product.all
    render json: @products
  end

  # POST /api/v1/products
  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: { errors: @product.errors.full_messages }, 
             status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description) # Adicione mais campos conforme necessário
  end
end