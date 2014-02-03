class Race < ActiveRecord::Base
  belongs_to :season

  validates :season_id, presence: true
  validates :date, presence: true
  validates :venue, presence: true, length: { maximum: 255 }
end
