class Mission < ApplicationRecord
  belongs_to :user, optional: true
  has_many :missions_invoices, dependent: :destroy

  validates :name, presence: true
end
