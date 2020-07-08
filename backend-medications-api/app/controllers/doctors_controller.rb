class DoctorsController < ApplicationController

  def index
    doctors = Doctor.all
    render json: DoctorSerializer.new(doctors)
  end

  def show
    doctor = Doctor.find(params[:id])
    options = {
      include: [:patient]
    }
    render json: DoctorSerializer.new(doctor, options)
  end

end
