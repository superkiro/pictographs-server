class Pictograph < ActiveRecord::Base
  attr_accessible :text, :photo

has_attached_file :photo, :styles => { :small => "150x150>" },
                  :url  => "/assets/pictographs/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/pictographs/:id/:style/:basename.:extension"

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

def self.getNames
	p = Pictograph.all
	list = []
	for i in p do
	list << i.text
	end
	return list

end

end
