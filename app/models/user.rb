class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :missions
  has_many :clients, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :simulations, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  validates :siret, presence: true, uniqueness: true, format: { with: /\A\d{8}\z/, message: "Entrez les 8 chiffres de votre numéro SIRET" }
  validates :tax_rate, presence: true
  validates :vat, presence: true
  validates :address, presence: true

  def get_total_submitted
    # self.invoices.where(status: "submitted").pluck(:total_amount_ttc).reduce(:+)
    self.invoices.where(status: "sent").sum(:total_amount_ht)
  end

  def get_total_paid
    self.invoices.where(status: "paid").sum(:total_amount_ht)
  end

  def get_total_delayed
    self.invoices.where(status: "delayed").sum(:total_amount_ht)
  end

  def total_paid_ht_per_month
    # TODO: WORKS ONLY WITH ONE YEAR FOR NOW
    invoices.
      select("CAST (date_part('month', payment_date) AS Integer) AS month, SUM(total_amount_ht) AS total").
      where(status: :paid).
      group('month').
      order('month')
  end

  def total_paid_ht_per_quarter
    invoices.
      select("
        CASE
          WHEN CAST (date_part('month', payment_date) AS Integer) BETWEEN 1 AND 3 THEN 1
          WHEN CAST (date_part('month', payment_date) AS Integer) BETWEEN 4 AND 6 THEN 2
          WHEN CAST (date_part('month', payment_date) AS Integer) BETWEEN 7 AND 9 THEN 3
          ELSE 4
        END
        AS quarter,
        SUM(total_amount_ht) AS total
      ").
      where(status: :paid).
      group('quarter').
      order('quarter')
  end


  def total_paid_for_current_quarter
    quarter = Date.today.month / 3

    return invoices.
      where(status: :paid).
      where("
        CASE
          WHEN CAST (date_part('month', payment_date) AS Integer) BETWEEN 1 AND 3 THEN 1
          WHEN CAST (date_part('month', payment_date) AS Integer) BETWEEN 4 AND 6 THEN 2
          WHEN CAST (date_part('month', payment_date) AS Integer) BETWEEN 7 AND 9 THEN 3
          ELSE 4
        END = #{quarter}
      ").
      sum('total_amount_ht')
  end
end
