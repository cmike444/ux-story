class Feature < ActiveRecord::Base
  include ActionView::Helpers
  
  has_many :stories
  belongs_to :project

  def to_csv
      attributes = %w{ payload }
      
      CSV.generate(headers: true) do |csv|
        csv << ["Stories"]

        self.stories.each do |story|
          csv << ["#{story.sanitized_payload}"]
        end
      end   
    end
end
