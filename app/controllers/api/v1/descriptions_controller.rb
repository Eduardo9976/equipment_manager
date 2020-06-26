class Api::V1::DescriptionsController < Api::V1::ApiController
  def index
    @descriptions = Description.all
  
    render json: @descriptions.as_json(exclude: [:created_at, :update_at])
  end

  def show
    @description = Description.find(params[:id])
    render json: @description

  rescue ActiveRecord::RecordNotFound
    render json: 'Não encontrado', status: :not_found
  end  

  def create
    @description = Description.new(description_params)
    if @description.save
      render json: {status: 'SUCCESS', message:'Saved Description'},status: :ok
    else
      render json: {status: 'ERROR', message:'Description not saved'},status: :unprocessable_entity
    end
  end  

  def update
    @description = Description.find(params[:id])
    if @description.update_attributes(description_params)
      render json: {status: 'SUCCESS', message:'Updated Description'},status: :ok
    else
      render json: {status: 'ERROR', message:'Description not update'},status: :unprocessable_entity
    end
  end

  def destroy
    @description = Description.find(params[:id])
    @description.destroy
    render json: {status: 'SUCCESS', message:'Deleted Description'},status: :ok
  end

  private

  def description_params
    params.permit(:product_id, :model, :serie_number,
      :memory, :hard_drive, :operational_system,
    :warranty)
  end
end