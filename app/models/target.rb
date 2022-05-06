class Target < ApplicationRecord

  #association
  belongs_to :user

  has_many :target_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #validation
  with_options presence: true do
    validates :title, length: {maximum: 20}
    validates :description, length: {maximum: 150}
  end

  #userのfavoriteを判定
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
