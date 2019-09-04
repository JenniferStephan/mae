class Simulation < ApplicationRecord
  belongs_to :user

  ACTIVITIES = ["liberale", "commerciale ou industrielle", "artisanale"]
  YEAREXISTENCE = [1, 2, 3, 4]

  before_save :set_result

  validates :year_existence, presence: true, inclusion: { in: YEAREXISTENCE }

  def set_result
    if activity == "liberale" && year_existence == 2 && accre == true
      self.result = 0.12
      self.user.update(tax_rate: self.result)
    else
      self.result = 0.23
      self.user.update(tax_rate: self.result)
    end
  end
end
