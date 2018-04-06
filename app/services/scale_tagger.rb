class ScaleTagger
  attr_reader :record, :user

  def initialize(record, scale_taggings, user)
    @record = record
    @scale_taggings = JSON.parse(scale_taggings)
    @user = user
  end

  def call
    scale_taggings.each do |id, val|
      if scale = Scale.find(id)
        ScaleTag.create!(
          scale: scale,
          value: val.to_f,
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
    def scale_taggings
      @scale_taggings.reject do |id, val|
        id.in? ['new', 'new_scale']
      end
    end
end
