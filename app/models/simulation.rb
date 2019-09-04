class Simulation < ApplicationRecord
  belongs_to :user

  ACTIVITIES = ["Libérale", "Commerciale ou industrielle", "Artisanale"]
  YEAREXISTENCE = [1, 2, 3, 4]


  before_save :set_result

  validates :year_existence, presence: true, inclusion: { in: YEAREXISTENCE }

  def set_result
    if activity == "Libérale" && year_existence == 1 && reglementary == false && accre == true
      self.result = 0.12
      self.user.update(tax_rate: self.result)
    else
      self.result = 0.23
      self.user.update(tax_rate: self.result)
    end
  end
end
