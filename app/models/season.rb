class Season < ActiveRecord::Base
  has_many :races
  validates :name, presence: true, length: { maximum: 255 }
end
