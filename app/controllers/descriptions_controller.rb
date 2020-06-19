class DescriptionsController < ApplicationController
  before_action :set_description, only: %i[show edit update destroy]
  before_action :bd_all

  def index
    @descriptions = Description.all
    
    if params[:product_id].present?
      @descriptions = Description.where(product_id: params[:product_id])
    end  
  end


  def new
    @description = Description.new  
  end
  def create
    @description = Description.new(description_params)
    if @description.save
      flash[:notice] = "Descrição criada com sucesso"
      redirect_to @description
    else
      render :new
    end
  end

  def show
    
  end  

  def edit

  end  
  def update 
    if @description.update(description_params)
      flash[:notice] = 'Salvo com sucesso'
      redirect_to @description
    else
      render :edit
    end
  end
  
  def destroy
    @description.destroy
    redirect_to descriptions_path
  end  

  def search 
    @search_query = params[:query]
    @descriptions = Description.where("model LIKE ?", "%#{@search_query}%")
    .or(Description.where(serie_number: @search_query))   
  end  
  

  private 

  def bd_all
    @product = Product.all
  end

  def set_description 
    @description = Description.find(params[:id])
  end  

  def description_params
    params.require(:description).permit(:product_id, :model, :serie_number,
                                        :memory, :hard_drive, :operational_system,
                                      :warranty)
  end  
end  