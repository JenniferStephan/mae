class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :missions_invoices, dependent: :destroy
  has_many :missions, through: :missions_invoices
  accepts_nested_attributes_for :missions_invoices, reject_if: :all_blank, allow_destroy: true

enum status: [:draft, :submitted, :sent, :paid, :delayed, :archived]

  before_save :generate_reference, if: :sent?

  validates :title, presence: true
  validates :creation_date, presence: true
  validates :status, presence: true

  def generate_reference
    self.reference = "JS-BG-#{self.id}"
  end
end
