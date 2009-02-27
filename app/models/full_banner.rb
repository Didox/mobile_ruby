class FullBanner < ActiveRecord::Base
  has_and_belongs_to_many :pages
  before_update :upload_file
  after_create :upload_file_save
  before_destroy :remove_folder

  protected
  def upload_file    
    unless self.file.is_a?(String)
       remove_folder
       dir = "/fullbanners/#{self.id}"
       self.file = Uploadfile::save(self.file, dir)
    end
  end

  def upload_file_save
    unless self.file.is_a?(String)
       dir = "/fullbanners/#{self.id}"
       self.file = Uploadfile::save(self.file, dir)
       self.save
    end
  end

  def remove_folder
    dir = "/fullbanners/#{self.id}"
    Uploadfile::removedir(dir)
  end

end
