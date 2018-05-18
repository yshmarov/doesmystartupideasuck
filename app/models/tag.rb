class Tag < ApplicationRecord
  has_many :idea_tags, inverse_of: :tag
  has_many :ideas, through: :idea_tags
  def to_s
    name
  end
end