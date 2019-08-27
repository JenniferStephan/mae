class Invoice < ApplicationRecord
  belongs_to :user
  has_many :missions_invoices

enum status: [:draft, :submitted, :sent, :paid, :delayed, :archived]

  before_save :generate_reference, if: :sent?

  validates :title, presence: true
  # validates :creation_date, presence: true
  validates :status, presence: true

  def generate_reference
    self.reference = "JS-BG-#{self.id}"
  end
end
