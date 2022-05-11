class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  #自分がフォローする側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
  #自分がフォローした人の一覧をフォローされた人(followed)を参照して出力
  has_many :followings, through: :relationships, source: :followed

  #自分がフォローされる側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: :followed_id, dependent: :destroy
  #自分をフォローしている人の一覧をフォローした人(follower)を参照して出力
  has_many :followers, through: :reverse_of_relationships,source: :follower

  has_many :targets, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :target_comments, dependent: :destroy
  has_many :time_stamps, dependent: :destroy

  validates :name, presence: true, length: {minimum: 2, maximum: 15}
  validates :introduction, length: {maximum: 50}

  has_one_attached :profile_image

  #画像を取得する処理
  def get_icon
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  #フォローする際の処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  #フォローを外す際の処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  #フォローしているかの判別
  def following?(user)
    followings.include?(user)
  end
end
