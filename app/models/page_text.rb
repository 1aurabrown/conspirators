class PageText < ActiveRecord::Base
  validates_presence_of [:title, :text]
end
