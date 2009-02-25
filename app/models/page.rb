class Page < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :popups
  has_and_belongs_to_many :full_banners
  
  acts_as_tree :order=>"name"
  #acts_as_threaded :order=>"name"

end
