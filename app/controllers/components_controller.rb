class ComponetsController < ApplicationController
  before_action :set_component, only: [:show, :edit, :update]

  def index
    @components = Component.all 
  end  

  
  def new
    @component = Component.new
  end
  def create 
    @component = Component.new(params_Description)
    if @component.save
      flash[:notice] = 'Cadastrado com sucesso'
      redirect_to @component
    else
      flash[:notice] = 'Algo deu errado, tente novamente.'
      render :new
    end 
  end
  
  def show
  end  
 
  private
  def set_component
    @component = Component.find(params[:id])
  end 


   def params_component
    params.require(:component).permit(:name, :type)
  end
end  