class ScaleTag < ApplicationRecord
  belongs_to :record
  belongs_to :scale
  belongs_to :user

  delegate :left, :right, to: :scale, prefix: :scale
end
