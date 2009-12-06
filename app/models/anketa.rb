class Anketa < ActiveRecord::Base
  belongs_to :poll
  has_many :questions, :dependent => :destroy #звязок питань та видалення питань
  has_many :results, :dependent => :destroy
end
