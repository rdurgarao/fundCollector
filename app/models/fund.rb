class Fund < ActiveRecord::Base
  validates :description, presence: true

end
