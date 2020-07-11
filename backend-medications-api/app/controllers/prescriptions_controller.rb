class PrescriptionsController < ApplicationController

  def index
    prescriptions = Prescription.all
    render json: PrescriptionSerializer.new(prescriptions)
  end

  def show
    prescription = Prescription.find(params[:id])
    options = {
      include: [:medication, :patient]
    }
    render json: PrescriptionSerializer.new(prescription, options)
  end

  def create
    prescription = Prescription.new(p_params)

    render json: prescription.save
  end

  private

  def p_params
      params.permit(:dosagestotal, :dosagesper, :dosagesfrequency, :patient_id, :medication_id)
  end

end
