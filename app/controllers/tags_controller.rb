class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_record

  def index
  end

  def new
  end

  def create
    FreeTagger.call(@record, tags_params[:free_tags], current_user)
    NewDescriptiveTagger.call(@record, tags_params[:new_descriptives], current_user)
    ScaleTagger.call(@record, tags_params[:scale_tags], current_user)
    NewScaleTagger.call(@record, tags_params[:scale_tags], current_user)
    redirect_to record_tags_path(@record)
  end

  private
    def set_record
      @record = Record.find(params[:record_id])
    end

    def tags_params
      params.require(:tags).permit(:free_tags, :new_descriptives, :scale_tags)
    end
end
