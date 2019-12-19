class InvitationsController < Devise::InvitationsController
  layout "application"
  before_action :update_sanitized_params, only: :update

  # POST /resource/invitation
  def create

    super
    
  end

  ##=> added to allow for customized params to be for tested forms.
  def update
    respond_to do |format|
      format.js do
        invitation_token = Devise.token_generator.digest(resource_class, :invitation_token, update_resource_params[:invitation_token])
        self.resource = resource_class.where(invitation_token: invitation_token).first
        resource.skip_password = true
        resource.update_attributes update_resource_params.except(:invitation_token)
      end
      format.html do
        super
      end
    end
  end


  protected

  def invite_params
    new_user_params
  end

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:password, :password_confirmation, :invitation_token, :name, :username])
  end


  

  def new_user_params
    params.require(:user).permit(:name, :role, :email, positions_attributes: [:title, :company_id, company_attributes: [:name]])
  end
end