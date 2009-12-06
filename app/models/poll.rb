class Poll < ActiveRecord::Base
  has_many :anketas, :dependent => :destroy
  belongs_to :user
end

