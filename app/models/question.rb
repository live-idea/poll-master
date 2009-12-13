class Question < ActiveRecord::Base
  belongs_to :anketa
  validates_presence_of :body
end