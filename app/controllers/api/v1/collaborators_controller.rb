class Api::V1::CollaboratorsController < Api::V1::ApiController
  def index
    @collaborators = Collaborator.all
  
    render json: @collaborators.as_json(exclude: [:created_at, :update_at])
  end

  def show
    @collaborator = Collaborator.find(params[:id])
    render json: @collaborator

  rescue ActiveRecord::RecordNotFound
    render json: 'Não encontrado', status: :not_found
  end  

  def create
    @collaborator = Collaborator.new(collaborator_params)
    if @collaborator.save
      render json: {status: 'SUCCESS', message:'Saved collaborator'},status: :ok
    else
      render json: {status: 'ERROR', message:'Collaborator not saved'},status: :unprocessable_entity
    end
  end

  def update
    @collaborator = Collaborator.find(params[:id])
    if @collaborator.update_attributes(collaborator_params)
      render json: {status: 'SUCCESS', message:'Updated Collaborator'},status: :ok
    else
      render json: {status: 'ERROR', message:'Colaborator not update'},status: :unprocessable_entity
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    @collaborator.destroy
    render json: {status: 'SUCCESS', message:'Deleted Collaborator'},status: :ok
  end

  private

  def collaborator_params
    params.permit(:name, :email, :registration)
  end  
end