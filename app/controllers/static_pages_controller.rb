class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build # これは、Micropost.new(user_id: current_user.id)と同じです。前者の方はcurrent_userのhas_many :micropostsで生成されるbuildメソッドを使用していて、確実にuser_idが紐付いたデータを作成できるのでこちらを使用するようにしましょう。
    @feed_items = current_user.feed_items.includes(:user).page(params[:page]).per(5).order(created_at: :desc)
  end
end
