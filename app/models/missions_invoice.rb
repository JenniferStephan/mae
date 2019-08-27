class MissionsInvoice < ApplicationRecord
  belongs_to :mission
  belongs_to :invoice
end
