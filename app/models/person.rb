class Person < ApplicationRecord
  validates :name, presence: true, length: { maximum: 48 }
end
