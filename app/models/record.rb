class Record < ApplicationRecord
  belongs_to :user
  has_many :free_tags
  has_many :scale_tags
end
