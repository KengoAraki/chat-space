class GroupsController < ApplicationController

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    @group= Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      redirect_to new_group_path, alert: "グループ名を入力してください"
    end
  end


  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
