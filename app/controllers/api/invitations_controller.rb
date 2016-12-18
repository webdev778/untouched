class API::InvitationsController < API::BaseController

  before_filter :user_from_invitation_token, :only => [:destroy]

  def index
    users = User.created_by_invite.where(company_id: params[:company_id])

    render json: users.to_json()
  end

  def destroy
    User.destroy(@user.id)
    flash[:notice] = 'Invitation removed'
    render json: flash.to_hash
  end

  private

  def user_from_invitation_token
    unless params[:invitation_token] && @user = User.where(invitation_token: params[:invitation_token]).first
      flash[:error] = 'Invitation not found'
      render json: flash.to_hash
    end
  end

end

