class Persona < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_and_belongs_to_many :stories
end
