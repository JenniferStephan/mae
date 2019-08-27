class Client < ApplicationRecord
  belongs_to :user
  has_many :invoices

  validates :siret, optional: true, uniqueness: true, format: { with: /\A\d{8}\z/, message: "Entrez les 8 chiffres de votre numéro SIRET" }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :company_address, presence: true
end
