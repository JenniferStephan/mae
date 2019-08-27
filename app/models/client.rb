class Client < ApplicationRecord
  belongs_to :user, optional: true
  has_many :invoices
end
