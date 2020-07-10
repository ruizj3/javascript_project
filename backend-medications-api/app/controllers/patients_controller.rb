class PatientsController < ApplicationController

  def index
    patients = Patient.all
    render json: PatientSerializer.new(patients)
  end

  def show
    patient = Patient.find(params[:id])
    options = {
      include: [:doctor]
    }
    render json: PatientSerializer.new(patient, options)
  end

end
