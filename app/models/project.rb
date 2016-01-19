class Project < ActiveRecord::Base
  has_many :features
  has_many :stories, through: :features
  has_many :personas
  belongs_to :user
end
