class Favorite < ApplicationRecord

  #association
  belongs_to :user
  belongs_to :target
end
