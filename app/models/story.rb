class Story < ActiveRecord::Base
  include ActionView::Helpers
  
  belongs_to :feature
  has_and_belongs_to_many :personas

  def create_job_story(situation, need, outcome)
    self.payload = ("<b>When </b>" + situation + "<b>, I want </b>" + need + "<b> so that </b>" + outcome).html_safe
  end

  def sanitized_payload
    strip_tags(self.payload)
  end
end
