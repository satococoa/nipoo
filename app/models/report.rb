class Report < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  scope :date, lambda {|date| where(date: date) }
  scope :latest, lambda { where(date: latest_date) }
  scope :user, lambda {|user| where(user_id: user) }

  def self.latest_date
    maximum(:date)
  end
end
