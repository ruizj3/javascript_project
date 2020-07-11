class PrescriptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :dosagestotal, :dosagesper, :dosagesfrequency, :medication, :patient
  belongs_to :medication
  belongs_to :patient
  has_many :takedosage 
end
