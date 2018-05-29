class RecordSearcher
  attr_reader :free_tags

  def initialize(free_tags: [])
    @free_tags = Array(free_tags)
  end

  def call
    sql = free_tags.map do |tag|
      Record.joins(:descriptives).where(descriptives: {term: tag}).distinct.to_sql
    end.join(' INTERSECT ')
    return Record.all if sql.empty?
    Record.find_by_sql sql
  end

  def self.call(*args)
    new(*args).call
  end
end
