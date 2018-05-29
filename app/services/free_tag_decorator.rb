class FreeTagDecorator
  attr_reader :records, :free_tags

  def initialize(records, free_tags)
    @records = records
    @free_tags = Array(free_tags)
  end

  def call
    available_descriptive_ids = records.map{ |rec| rec.descriptives.pluck(:id) }.flatten.uniq
    Descriptive.all.map do |desc|
      OpenStruct.new(
        id: desc.id,
        term: desc.term,
        disabled: desc.id.in?(available_descriptive_ids) ? false : true,
        active: desc.term.in?(free_tags) ? true : false,
      )
    end
  end

  def self.call(*args)
    new(*args).call
  end
end
