class PatientSerializer
  include FastJsonapi::ObjectSerializer
  attributes
  belongs_to :doctor  
end
