class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter]
         #:token_authenticatable,

  has_many :posts
  has_many :identities, class_name: 'Metova::Identity'

  def password_required?
    return true
    super and (identities.none? or password.present?)
  end

end