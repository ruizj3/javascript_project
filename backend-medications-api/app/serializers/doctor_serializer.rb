class DoctorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :patient
  has_many :patient

  def patients
    self.object.patients.map do |patient|
      {name: patient.username
       }
    end
  end
end
