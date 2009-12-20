class Result < ActiveRecord::Base
  belongs_to :anketa
  belongs_to :responder
  has_many :answers, :dependent => :destroy
  

  def answers=(answers)
    answers.each do |a|
      self.answers << Answer.new(a[1])
    end
  end

end
