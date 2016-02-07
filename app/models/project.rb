class Project < ActiveRecord::Base
  include ActionView::Helpers

  has_many :features
  has_many :stories, through: :features
  has_many :personas
  belongs_to :user

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
