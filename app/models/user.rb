# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  ROLES = %w[admin user]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :user_id, :role, :name, :email, :password, :password_confirmation, :remember_me

  has_many :uploads, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 } 
  #validates :user_id, presence: true
  default_scope order: 'users.created_at DESC'

  #has_and_belongs_to_many :roles
  #def role?(role)
  #  return !!self.roles.find_by_name(role.to_s.camlize)
  #end
  def feedall
   #if User.where(":role = 'admin'", role: admin)
      Upload.all
   # else
      #Upload.where("protected = false", protected: false)
      #Upload.where("protected = false OR user_id = :user_id", protected: false)
   #   Upload.where("protected = false OR user_id = :user_id", protected: false, user_id)
   # end
  end
end
