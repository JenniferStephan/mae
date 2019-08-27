class Client < ApplicationRecord
  belongs_to :user, optional: true
end
