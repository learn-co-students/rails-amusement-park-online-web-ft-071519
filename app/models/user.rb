class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  validates :password, presence: true

  def mood
    nausea > happiness ? "sad" : "happy"
  end
end
