class Producer < ApplicationRecord
  validates :password_digest, presence: true
  validates :name, presence: true
end
