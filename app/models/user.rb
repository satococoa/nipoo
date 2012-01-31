class User < ActiveRecord::Base
  has_many :reports
  
  def self.find_or_create_by_auth_hash(auth)
    user = User.find_or_create_by_uid(auth['uid'])
    user.update_attributes(
      nickname: auth['info']['nickname'],
      name: auth['info']['name'],
      icon: auth['extra']['raw_info']['avatar_url'],
      token: auth['credentials']['token']
    )
    user
  end
  def member?(org)
    begin
      Octokit.organization_members(org).map(&:id).include? uid.to_i
    rescue => e
      Rails.logger.error "#{e.class}: #{e.message}"
      false
    end
  end
end
