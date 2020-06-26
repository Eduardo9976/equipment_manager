class Api::V1::ManufacturersController < Api::V1::ApiController
  def index
    @manufacturers = Manufacturer.all
  
    render json: @manufacturers.as_json(exclude: [:created_at, :update_at])
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
    render json: @manufacturer

  rescue ActiveRecord::RecordNotFound
    render json: 'Não encontrado', status: :not_found
  end  

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      render json: {status: 'SUCCESS', message:'Saved Manufacturer'},status: :ok
    else
      render json: {status: 'ERROR', message:'Manufacturer not saved'},status: :unprocessable_entity
    end
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
    if @manufacturer.update_attributes(manufacturer_params)
      render json: {status: 'SUCCESS', message:'Updated Manufacturer'},status: :ok
    else
      render json: {status: 'ERROR', message:'Manufacturer not update'},status: :unprocessable_entity
    end
  end
  
  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.destroy
    render json: {status: 'SUCCESS', message:'Deleted Manufacturer'},status: :ok
  end

  private
  def manufacturer_params
    params.permit(:name) 
  end  
  
end