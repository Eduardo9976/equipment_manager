class AllocationsController < ApplicationController
  #before_action :set_allocation, only: [:edit, :update]
  before_action :bd_all
  def index
    @allocations = Allocation.all 
  end  

  
  def new
    @allocation = Allocation.new
  end
  def create 
    @allocation = Allocation.new(params_allocation)
    if @allocation.save
      flash[:notice] = 'Cadastrado com sucesso'
      redirect_to @allocation
    else
      flash[:notice] = 'Algo deu errado, tente novamente.'
      render :new
    end 
  end
  
  def show

  end  
 
  private
  def bd_all
    #var para o collection
    @products = Product.all
    @descriptions = Description.all
    @collaborators = Collaborator.all
   end

   def params_allocation
    params.require(:allocation).permit(:collaborator_id, :product_id)
  end

 

end  