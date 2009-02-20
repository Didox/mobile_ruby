class User < ActiveRecord::Base
  belongs_to :group

  def authenticate(login, password)
    self.find_all_by_login_and_password(login, password)
  end
end
