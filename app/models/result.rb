class Result < ActiveRecord::Base
  belongs_to :anketa
  belongs_to :responder
  has_many :answers, :include=>[:question], :order=>"questions.position", :dependent => :destroy
  

  def answers=(answers)
    answers.each do |a|
      if a[1][:id]
        answer = self.answers.find_by_id(a[1][:id])
        answer.update_attributes(a[1])
        self.answers << answer
      else
        self.answers << Answer.new(a[1])
      end
    end
  end

end
