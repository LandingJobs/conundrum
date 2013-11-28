class User < ActiveRecord::Base

  devise :omniauthable, :rememberable, :trackable
  has_many :authentications

  def self.from_omniauth(auth, current_user)
    authorization = Authentication.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
    if authorization.user.blank?
      user = current_user.nil? ? User.where('email = ?', auth["info"]["email"]).first : current_user
      if user.blank?
        user = User.new
        user.name = auth.info.name
        user.email = auth.info.email
        auth.provider == "twitter" ?  user.save(:validate => false) :  user.save
      end
      authorization.user = user
      authorization.save
    end
    authorization.user
  end
end
