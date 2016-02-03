class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "backend"

  respond_to :html

  def index
    @personas = current_user.personas.all
    respond_with(@personas)
  end

  def show
    respond_with(@persona)
  end

  def new
    @persona = current_user.personas.build
    respond_with(@persona)
  end

  def edit
  end

  def create
    @persona = current_user.personas.build(persona_params)
    @persona.save
    redirect_to personas_path
  end

  def update
    @persona.update(persona_params)
    respond_with(@persona)
  end

  def destroy
    @persona.destroy
    respond_with(@persona)
  end

  private
    def set_persona
      @persona = Persona.find(params[:id])
    end

    def persona_params
      params.require(:persona).permit(:location, :quote, :avatar, :role_title, :role_description, :demographics, :persona_name, :user_id, :project_id)
    end
end
