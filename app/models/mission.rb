class Mission < ApplicationRecord
  belongs_to :user, optional: true
  has_many :missions_invoices
  has_many :invoices, through: :missions_invoices, dependent: :destroy

  validates :name, presence: true
end
