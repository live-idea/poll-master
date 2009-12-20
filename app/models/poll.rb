class Poll < ActiveRecord::Base
  has_many :anketas, :dependent => :destroy
  belongs_to :user
  validates_presence_of :title, :branch, :location, :state, :description
end

