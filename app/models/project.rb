class Project < ActiveRecord::Base
  has_many :stories
  has_many :personas
  belongs_to :user
end
