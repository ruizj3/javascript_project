class Patient < ApplicationRecord
  belongs_to :doctor
  has_many :prescription
end
