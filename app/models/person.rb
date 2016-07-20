class Person < ApplicationRecord
  validates :name, presence: true, length: { maximum: 48 }

  scope :sorted, -> { order('lower(name)') }

  def first_name
    name.split(' ')[0]
  end
end
