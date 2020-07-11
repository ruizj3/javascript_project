class Prescription < ApplicationRecord
  belongs_to :patient
  belongs_to :medication
  has_many :takedosage

  def takedose
    if self.dosagestotal >= self.dosagesper
      new_quantity = self.dosagestotal - self.dosagesper
      self.update(
        :dosagestotal => new_quantity
      )
    else
      "You do not have medication left to administer. Please contact your doctor."
    end
  end

end
