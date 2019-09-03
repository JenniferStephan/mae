class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :missions_invoices, dependent: :destroy
  has_many :missions, through: :missions_invoices
  accepts_nested_attributes_for :missions_invoices, reject_if: :all_blank, allow_destroy: true

  enum status: [:draft, :submitted, :sent, :paid, :delayed, :archived]

  before_save :generate_reference
  before_save :set_total_amounts
  before_save :set_due_date

  before_save :notif_delayed


  validates :title, presence: true
  validates :creation_date, presence: true
  validates :status, presence: true

  scope :to_be_delayed, -> { where('due_date < ?', Date.today).where.not(status: :paid) }

  def generate_reference
    reference = "JS-BG-#{id}"
  end

  def set_total_amounts
    self.total_amount_ttc = missions_invoices.inject(0) { |s, m_i| s + (m_i.man_day_quantity * m_i.price_rate * (1 + m_i.vat_rate)) }
    self.total_amount_ht = missions_invoices.inject(0) { |s, m_i| s + (m_i.man_day_quantity * m_i.price_rate) }
  end

  def set_due_date
    self.due_date = creation_date + 30.days
  end


  def notif_delayed
    if self.status == "delayed"
      new_notif_delayed = Notification.create(user: current_user,
        category: "Paiement en retard",
        content: "Votre client #{self.client.company_name} ne vous a toujours pas réglé la facture numéro #{self.reference}, d'un montant de #{self.total_amount_ttc} euros. Le paiement était dû au #{self.due_date}." )
    end
  end

end
