class EndUsersController < ApplicationController

  def show
    @end_users = EndUser.find(params[:id])
    if @client_users.id != current_client_user.id
      redirect_to "/client_users/#{current_client_user.id}"
    end
  end

  def edit
  end

end
