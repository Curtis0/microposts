class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User" # ここで、followerはフォローされているユーザー、followedはフォローしているユーザーを指します。
  belongs_to :followed, class_name: "User" # followerとfollowedの実体はUserクラスのオブジェクトなので上記のようにclass_nameを指定します。
end
