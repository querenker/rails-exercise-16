class Paper < ActiveRecord::Base

  validates :title, :venue, presence: true

end
