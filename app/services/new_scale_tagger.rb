class NewScaleTagger
  attr_reader :record, :user, :scale_taggings

  def initialize(record, scale_taggings, user)
    @record = record
    @scale_taggings = JSON.parse(scale_taggings)
    @user = user
  end

  def call
    if new_scale_present?
      new_scale = Scale.create!(
        left: new_scale_term('left'),
        right: new_scale_term('right'),
      )
      create_tag(new_scale.id)
    end
  end

  def self.call(*args)
    new(*args).call
  end

  private
    def new_scale_present?
      new_scale_value && new_scale_term('left') && new_scale_term('right')
    end

    def create_tag(scale_id)
      formatted_scale_param = {scale_id => new_scale_value}.to_json
      ScaleTagger.call(record, formatted_scale_param, user)
    end

    def new_scale_value
      scale_taggings['new']&.to_f
    end

    def new_scale_term(side)
      scale_taggings.dig('new_scale', side)&.strip&.downcase
    end
end
