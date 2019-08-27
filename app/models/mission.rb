class Mission < ApplicationRecord
  belongs_to :user, optional: true
  has_many :missions_invoices

  validates :name, presence: true
end
