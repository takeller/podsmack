class ProducersController <ApplicationController

  def show
    @producer = Producer.find(params[:id])
  end

  private
  def producer_params
    params.require(:producer).permit(:name, :password, :password_confirmation)
  end
end
