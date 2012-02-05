class Report < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :date, :presence => true
  validates :body, :presence => true
  validates :user_id, :presence => true

  scope :date, lambda {|date| where(date: date) }
  scope :user, lambda {|user| where(user_id: user) }

  def self.latest_date
    maximum(:date)
  end
end
