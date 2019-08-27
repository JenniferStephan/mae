class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :missions_invoices

enum status: [:pending, :submitted, :sent, :paid, :delayed, :archived]

  before_save :generate_reference if :submitted?

  validates :title, presence: true
  # validates :creation_date, presence: true
  validates :status, presence: true

  def generate_reference
    binding.pry
  end
end
