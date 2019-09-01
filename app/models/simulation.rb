class Simulation < ApplicationRecord
  belongs_to :user

  ACTIVITIES = ["liberale", "commerciale ou industrielle", "artisanale"]
  YEAREXISTENCE = [1, 2, 3, 4]

  before_save :set_result

  validates :year_existence, presence: true, inclusion: { in: YEAREXISTENCE }
  validates :accre, presence: true

  def set_result
    if self.activity = "liberale" && self.year_existence = 2 && self.accre == true
      self.result = 0.12
    else
      self.result = 0.23
    end
    self.save
  end
end
