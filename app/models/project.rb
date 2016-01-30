class Project < ActiveRecord::Base
  has_many :features
  has_many :stories, through: :features
  has_many :personas
  belongs_to :user

  after_create :create_first_section

  def create_first_section
    self.features.create(name: "Section #1")
  end

end
