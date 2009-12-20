class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :result
  validates_presence_of :body
end
