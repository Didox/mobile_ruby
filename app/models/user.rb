class User < ActiveRecord::Base

  public 
  def self.authenticate(login, password)
    self.find_all_by_login_and_password(login, password)
  end
end
