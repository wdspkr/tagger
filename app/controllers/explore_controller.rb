class ExploreController < ApplicationController
  layout 'vue', only: :index

  def index
  end

  def search
    @records = RecordSearcher.call(free_tags: params[:free_tags])
    @free_tags = FreeTagDecorator.call(@records, params[:free_tags])
  end
end
