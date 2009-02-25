class User < ActiveRecord::Base

  public 
  def self.authenticate(login, password)
    user = self.find_all_by_login_and_password(login, password)
    if user == nil || user.empty?
      return nil
    end
    user
  end
end
