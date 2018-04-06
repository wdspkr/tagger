class NewDescriptiveTagger
  attr_reader :record, :user

  def initialize(record, new_terms, user)
    @record = record
    @new_terms = new_terms
    @user = user
  end

  def call
    new_terms.each do |term|
      descriptive = Descriptive.find_or_create_by!(term: term)
      FreeTagger.call(record, descriptive.id, user)
    end
  end

  def self.call(*args)
    new(*args).call
  end

  private
    def new_terms
      @new_terms.split(';').map(&:strip).map(&:downcase)
    end
end
