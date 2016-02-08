class Feature < ActiveRecord::Base
  include ActionView::Helpers
  
  has_many :stories
  belongs_to :project

  def to_csv(options = {})
    attributes = %w{ payload }
    
    CSV.generate(options) do |csv|
      csv << ["Stories"]

      self.stories.each do |story|
        csv << ["#{story.sanitized_payload}"]
      end
    end   
  end

  def to_txt
    File.open("#{self.name.gsub(' ','_')}.txt", "w+") do |f|
      self.stories.each do |story|
        f.puts "story.sanitized_payload"
      end
    end
  end
end
