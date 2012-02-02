class Report < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  scope :today, where(date: Date.today)
  scope :yesterday, where(date: Date.yesterday)
  scope :date, lambda {|date| where(date: date) }
end
