class User < ActiveRecord::Base
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
end
