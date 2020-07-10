class PatientSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :dob, :doctor
  belongs_to :doctor
end
