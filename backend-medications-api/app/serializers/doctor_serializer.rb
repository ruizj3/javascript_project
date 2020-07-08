class DoctorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :patient
  has_many :patient
end
