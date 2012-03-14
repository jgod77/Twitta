class User < ActiveRecord::Base
  
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  attr_accessor :temp_password
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  before_save do
    unless self.temp_password.nil?
      self.password = User.encrypt_password(self.temp_password)
    end
  end
  
  def self.encrypt_password(pw)
    Digest::SHA1.hexdigest(pw)    
  end
end
