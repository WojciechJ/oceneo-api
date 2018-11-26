class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = Product.all
    @products_data = []
    for @p in @products do
      if (Rate.where(product_id: @p.id)).empty?
        @avg = 0
        @count = 0
      else
        @rates = Rate.where(product_id: @p.id)
        @avg = Float(@rates.average(:value))
        @count = @rates.count
      end
      @p = @p.attributes
      @p[:avg] = @avg
      @p[:opinions_count] = @count
      @products_data.push(@p)
    end

    render json:{"products": @products_data}
  end

  # GET /products/1
  def show
    render json: @product
  end

  def rate_stats
    if (Rate.where(product_id: params[:id])).empty?
      @avg = 0
      @count = 0
    else
      @rates = Rate.where(product_id: params[:id])
      @avg = @rates.average(:value)
      @count = @rates.count
    end
    render json:{
    "average": @avg,
    "count": @count}
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :description)
    end
end
