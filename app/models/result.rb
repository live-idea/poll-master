class Result < ActiveRecord::Base
  belongs_to :anketa
  belongs_to :responder
  has_many :answers, :dependent => :destroy
end
