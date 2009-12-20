class Question < ActiveRecord::Base
  belongs_to :anketa
  validates_presence_of :body

  def validate
    if (self.qtype == 'select')
      self.errors.add(:variants, :variants_can_not_be_ampty) if self.variants.empty?
    end
  end
  
end