class FreeTag < ApplicationRecord
  belongs_to :record
  belongs_to :descriptive
  belongs_to :user

  delegate :term, to: :descriptive
end
