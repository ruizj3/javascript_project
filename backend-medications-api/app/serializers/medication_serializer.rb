class MedicationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :priceperpill
end
