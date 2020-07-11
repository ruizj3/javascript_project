class Takedosage < ApplicationRecord
  belongs_to :prescription

  validates :datetaken, :prescription_id, presence: true
  validate do
    takedosgae_valid?
  end


  private

  def takedosgae_valid?
    if self.prescription_id == "" || self.datetaken == ""
      self.errors.add(:invalid, "prescripton_id not connected")
    end
  end

end
