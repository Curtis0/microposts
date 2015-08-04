class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create] # 2行目のbefore_actionで、ApplicationControllerにあるlogged_in_userメソッドを実行し、ログインしていない場合はcreateメソッドは実行しないで/loginにリダイレクトするようにしています。
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
    
  private
  
  def micropost_params
    params.require(:micropost).permit(:content)
  end
    
end
