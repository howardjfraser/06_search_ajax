class Person < ApplicationRecord
  validates :name, :job_title, presence: true, length: { maximum: 48 }
  validates :bio, presence: true, length: { maximum: 512 }

  scope :sorted, -> { order('lower(name)') }
  scope :search, ->(term) { sorted.where('name like ?', "%#{term}%") }

  def first_name
    name.split(' ')[0]
  end
end
