class FreeTagger
  attr_reader :record, :user

  def initialize(record, descriptive_ids, user)
    @record = record
    @descriptive_ids = descriptive_ids
    @user = user
  end

  def call
    descriptive_ids.each do |id|
      if descriptive = Descriptive.find(id)
        FreeTag.create!(
          descriptive: descriptive,
          record: record,
          user: user,
        )
      end
    end
  end

  def self.call(*args)
    new(*args).call
  end

  private
    def descriptive_ids
      case @descriptive_ids
      when String
        @descriptive_ids.split(',')
      else
        Array @descriptive_ids
      end
    end
end
