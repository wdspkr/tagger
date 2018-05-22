class ExploreController < ApplicationController
  layout 'vue', only: :index

  def index
  end

  def search
    @records = Record.all
    @free_tags = Descriptive.all
  end
end

class RecordSearcher
  attr_reader :tag_list

  def initialize(tag_list)
    @tag_list = tag_list
  end

  def call

  end

  def self.call(*args)
    new(*args).call
  end
end
