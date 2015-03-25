class User < ActiveRecord::Base
  has_many :restourants
  has_many :ratings


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  before_create :set_default_role

  def owner?
    self.role_name == "owner"
  end

  def registered?
    self.role_name == "registered"
  end


  private
  # role_name = "owner" || "registered"
  def set_default_role
     self.role_name = "registered"
  end

end
