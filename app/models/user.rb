class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :missions
  has_many :clients, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :notifications
  has_many :simulations

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  validates :siret, presence: true, uniqueness: true, format: { with: /\A\d{8}\z/, message: "Entrez les 8 chiffres de votre numéro SIRET" }
  validates :tax_rate, presence: true
  validates :vat, presence: true
  validates :address, presence: true
end
