class Anketa < ActiveRecord::Base
  belongs_to :poll
  has_many :questions, :order=>"position ASC", :dependent => :destroy #звязок питань та видалення питань
  has_many :results, :dependent => :destroy
  validates_presence_of :title, :code, :description

  def active?
    self.state == 'active'
  end
  
end
