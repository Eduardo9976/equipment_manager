class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]
  before_action :bd_all
  def start 
    @collaborator = Collaborator.find(params[:id])
    @available_equips = @description.where(situation: 0)
    @reservation = Reservation.new
  end
  def create 
    @reservation = Reservation.new(params_reservation)
    if @reservation.save
      flash[:notice] = 'Cadastrado com sucesso'
      redirect_to @reservation
    else
      flash[:notice] ='Algo deu errado, tente novamente.'
      render :new  
    end  
  end  

  private

  
  def bd_all
    @collaborator = Collaborator.all
    @description = Description.all
    @product = Product.all
    
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end 


   def params_reservation
    params.require(:reservation).permit(:collaborator_id, :description_id)
  end

end  