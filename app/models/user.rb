class User < ActiveRecord::Base
  has_many :restourants
  has_many :user_roles
  has_many :roles, through: :user_roles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  before_create :set_default_role

  private
  def set_default_role
     @user_role = self.user_roles.new
     @user_role.role_id = Role.find_by_name('registered')
  end

end
