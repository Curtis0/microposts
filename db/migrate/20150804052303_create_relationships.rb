class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :follower, index: true
      t.references :followed, index: true
      
      t.timestamps
      
      t.index [:follower_id, :followed_id], unique: true # ここでは、t.index [:follower_id, :followed_id], unique: trueを追加することにより、follower_idとfollowed_idのペアが他のrelationshipとは異なるように、複合インデックスを設定しています。
    end
  end
end
