class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :missions_invoices

STATUS = ["pending", "sent", "paid", "delayed", "archived"]

  validates :title, presence: true
  validates :creation_date, presence: true
  validates :status, presence: true, default: "pending", inclusion: { in: STATUS }
end
