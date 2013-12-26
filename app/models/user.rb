class User < ActiveRecord::Base
  include Paperclip::Glue
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :avatar, :user_name
  has_attached_file :avatar, 
    :default_url => "/images/:attachment/missing/:style/missing.png",
    :path => ":rails_root/public/images/:attachment/:id/:style.:extension",     # 存储路径
    :url => "/images/:attachment/:id/:style.:extension",                        # 读取路径
    :styles => {:small => "16X16", :normal => "48X48", :large => "64X64", :big => "120X120"}

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
