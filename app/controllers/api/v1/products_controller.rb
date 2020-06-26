class Api::V1::ProductsController < Api::V1::ApiController
  def index
    @products = Product.all
  
    render json: @products.as_json(exclude: [:created_at, :update_at])
  end

  def show
    @product = Product.find(params[:id])
    render json: @product

  rescue ActiveRecord::RecordNotFound
    render json: 'Não encontrado', status: :not_found
  end  

  def create
    @product = Product.new(params_product)
    if @product.save
      render json: {status: 'SUCCESS', message:'Saved Product'},status: :ok
    else
      render json: {status: 'ERROR', message:'Product not saved'},status: :unprocessable_entity
    end
  end  

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params_product)
      render json: {status: 'SUCCESS', message:'Updated Product'},status: :ok
    else
      render json: {status: 'ERROR', message:'Product not update'},status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {status: 'SUCCESS', message:'Deleted Product'},status: :ok
  end
  

  private
  
  def params_product
    params.permit(:name, :manufacturer_id)
  end

end