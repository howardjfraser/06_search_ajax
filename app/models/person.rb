class Person < ApplicationRecord
  validates :name, :job_title, presence: true, length: { maximum: 48 }
  validates :bio, presence: true, length: { maximum: 512 }

  scope :sorted, -> { order('lower(name)') }

  def first_name
    name.split(' ')[0]
  end

  def self.search(query)
    where('name like ?', "%#{query}%")
  end
end
