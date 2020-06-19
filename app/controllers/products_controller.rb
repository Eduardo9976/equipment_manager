class ProductsController < ApplicationController
  before_action :manufacturer_all, only: %i[new create edit update]
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all 
  end  

  def new
    @product = Product.new
  end
  def create 
    @product = Product.new(params_product)
    if @product.save
      flash[:notice] = 'Cadastrado com sucesso'
      redirect_to @product
    else
      flash[:notice] = 'Algo deu errado, tente novamente.'
      render :new
    end 
  end
  
  def show

  end  
  

  def edit 
     
  end  
  def update
    if @product.update(params_product)
      flash[:notice] = 'Salvo com sucesso'
      redirect_to @product
    else
      render :edit
    end   
  end 
  
  def destroy
    if @product.destroy
      flash[:notice] = 'Produto deletado com sucesso!'
      redirect_to products_path
    else
      flash[:notice] = 'Algo deu errado, tente novamente'
      redirect_to product_path(product)
    end
  end
  
  
  private 
  def manufacturer_all
    #var para o collection
    @manufacturer = Manufacturer.all
   end

   def params_product
    params.require(:product).permit(:name, :manufacturer_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end 

  
end  
