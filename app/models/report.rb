class Report < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  scope :date, lambda {|date| where(date: date) }
  scope :latest, lambda {
    # TODO: サブクエリどうやるの？
    where(date: latest_date)
  }

  def self.latest_date
    maximum(:date)
  end
end
