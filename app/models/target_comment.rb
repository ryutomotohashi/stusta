class TargetComment < ApplicationRecord

  #association
  belongs_to :user
  belongs_to :target

  #validation
  validates :comment, presence: true
end
