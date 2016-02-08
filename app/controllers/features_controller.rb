class FeaturesController < ApplicationController
  before_action :set_feature, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @features = Feature.all
    respond_with(@features)
  end

  def show
    respond_to do |format|
      format.html
      format.csv { send_data @feature.to_csv,
        :disposition => "attachment", filename: "#{@feature.project.name.gsub(' ', '_')}.csv" }
        format.xls { send_data @feature.to_csv(col_sep: '\t'),
        :disposition => "attachment", filename: "#{@feature.name.gsub(' ', '_')}.xls" }
        format.json { send_data @feature.stories.to_json,
        :disposition => "attachment", filename: "#{@feature.name.gsub(' ', '_')}.json" }
    end
  end

  def new
    @feature = Feature.new
    respond_with(@feature)
  end

  def edit
  end

  def create
    @feature = Feature.new(feature_params)
    @feature.save
    respond_with(@feature.project)
  end

  def update
    @feature.update(feature_params)
    respond_with(@feature)
  end

  def destroy
    @feature.destroy
    respond_with(@feature)
  end

  private
    def set_feature
      @feature = Feature.find(params[:id])
    end

    def feature_params
      params.require(:feature).permit(:name, :project_id, :problem_statement)
    end
end
