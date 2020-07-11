class TakedosagesController < ApplicationController

  def index
    takedosages = Takedosage.all
    render json: TakedosageSerializer.new(takedosages)
  end

  def show
    takedosage = Takedosage.find(params[:id])
    options = {
      include: [:prescription]
    }
    render json: TakedosageSerializer.new(takedosage, options)
  end

  def create
    takedosage = Takedosage.new(takedosage_params)
    prescription = Prescription.find_by(id: takedosage_params[:prescription_id])
    prescription.takedose
    render json: takedosage.save ? takedosage : {message: takedosage.errors.messages[:invalid]}
  end


  private

  def takedosage_params
      params.require(:takedosage).permit(:prescription_id, :datetaken)
  end
end
