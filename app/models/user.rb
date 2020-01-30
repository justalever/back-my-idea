class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:stripe_connect]
  has_many :projects, dependent: :destroy

  def can_receive_payments?
    uid? &&  provider? && access_code? && publishable_key?
  end

end
