class Story < ActiveRecord::Base
  belongs_to :feature

  def create_job_story(situation, action, outcome)
    self.payload = ("<b>When </b>" + situation + "<b>, I want </b>" + action + "<b> so that </b>" + outcome).html_safe
  end
end
