class CollaboratorsController < ApplicationController
  before_action :set_collaborator, only: %i[show edit update destroy start]

  def index
    @collaborators = Collaborator.all
  end  

  def new
    @collaborator = Collaborator.new
  end
  def create 
    @collaborator = Collaborator.new(collaborator_params)
    if @collaborator.save
      flash[:notice] = "Criado com sucesso"
      redirect_to @collaborator
    else
      render :new
    end    
  end  

  def show
    
  end  

  def edit

  end  

  def update 
    if @collaborator.update(collaborator_params)
      flash[:notice] = 'Salvo com sucesso'
      redirect_to @collaborator
    else
      render :edit
    end
  end
  
  def destroy
    @collaborator.destroy
    redirect_to collaborators_path
  end  

  def search
    @search_query = params[:query]
    @collaborators = Collaborator.where("name LIKE ?", "%#{@search_query}%")
                                 .or(Collaborator.where(registration: @search_query))       
  end  
  

  private 
  def set_collaborator
    @collaborator = Collaborator.find(params[:id]) 
  end  
  def collaborator_params
    params.require(:collaborator).permit(:name, :email, :registration)
  end  

end  