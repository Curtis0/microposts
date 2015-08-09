class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    has_many :microposts
    
    has_many :following_relationships,  class_name:   "Relationship",
                                        foreign_key:  "follower_id",
                                        dependent:    :destroy
    has_many :following_users, through: :following_relationships, source: :followed
    has_many :follower_relationships,   class_name:   "Relationship",
                                        foreign_key:  "followed_id",
                                        dependent:    :destroy
    has_many :follower_users, through: :follower_relationships, source: :follower
    
    def follow(other_user) # following_relationshipをフォローしているユーザーのuser_idを指定して作成しています。
      following_relationships.create(followed_id: other_user.id)
    end
    
    def unfollow(other_user) # following_relationshipsからフォローしているユーザーのuser_idが入っているものを探して削除しています
      following_relationships.find_by(followed_id: other_user.id).destroy
    end
    
    def following?(other_user) # 他のユーザーがfollowing_usersに入っているかチェックしています。
      following_users.include?(other_user)
    end
    
    def feed_items
      Micropost.where(user_id: following_user_ids + [self.id]) # following_user_idsは、Userモデルのhas_many :following_usersの部分で自動的に生成されたメソッドで、フォローしているユーザーのIDを配列で返します
    end
    
    paginates_per 5
    max_paginates_per 5
end
