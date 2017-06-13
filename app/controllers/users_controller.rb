class UsersController < ApplicationController
  def search
    @users = User.where.not(id: current_user.id).where('name LIKE ?', "%#{params[:keyword]}%")
    respond_to do |format|
      format.json
    end
  end
end
