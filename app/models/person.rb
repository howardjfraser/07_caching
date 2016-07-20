class Person < ApplicationRecord
  validates :name, :job_title, presence: true, length: { maximum: 48 }

  scope :sorted, -> { order('lower(name)') }

  def first_name
    name.split(' ')[0]
  end
end
