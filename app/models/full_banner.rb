class FullBanner < ActiveRecord::Base
  validates_presence_of  :name, :file, :link, :date_begin, :date_end
  #validates_numericality_of :price
  #validate :upload_file
  #validates_uniqueness_of :title
  validates_format_of :file,
                    :with    => %r{\.(gif|jpg|png)$}i,
                    :message => 'Aceito somente os formatos (gif, jpg, pgn)'


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
