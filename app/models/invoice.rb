class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :missions_invoices, dependent: :destroy
  has_many :missions, through: :missions_invoices
  accepts_nested_attributes_for :missions_invoices, reject_if: :all_blank, allow_destroy: true

enum status: [:draft, :submitted, :sent, :paid, :delayed, :archived]

  before_save :generate_reference, if: :sent?
  before_save :set_total_amounts

  validates :title, presence: true
  validates :creation_date, presence: true
  validates :status, presence: true

  def generate_reference
    reference = "JS-BG-#{id}"
  end

  def set_total_amounts
    self.total_amount_ttc = missions_invoices.inject(0) { |s, m_i| s + (m_i.man_day_quantity * m_i.price_rate * (1 + m_i.vat_rate)) }
    self.total_amount_ht = missions_invoices.inject(0) { |s, m_i| s + (m_i.man_day_quantity * m_i.price_rate) }
  end

end
