class Mission < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, presence: true
end
