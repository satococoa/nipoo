class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :report

  validates :body, :presence => true
  validates :report_id, :presence => true
  validates :user_id, :presence => true
end
