class MissionsInvoice < ApplicationRecord
  belongs_to :mission
  belongs_to :invoice

  VAT = [0, 0.20]

  validates :man_day_quantity, presence: true, numericality: true
  validates :price_rate, presence: true, numericality: true
  validates :vat_rate, presence: true, inclusion: { in: VAT }, numericality: true

end
