class Prescription < ApplicationRecord
  belongs_to :patient
  belongs_to :medication
  has_many :takedosage
end
