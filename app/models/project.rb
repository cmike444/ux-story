class Project < ActiveRecord::Base
  include ActionView::Helpers

  has_many :features
  has_many :stories, through: :features
  has_many :personas, through: :stories
  has_and_belongs_to_many :users

  accepts_nested_attributes_for :users, allow_destroy: true, :reject_if => lambda { |a| a[:content].blank? }

  after_create :create_first_section

  def create_first_section
    self.features.create(name: "Section #1")
  end

  def to_csv(options = {})
    attributes = %w{ payload }
    
    CSV.generate(options) do |csv|
      csv << ["Stories"]

      self.stories.each do |story|
        csv << ["#{story.sanitized_payload}"]
      end
    end   
  end

end
