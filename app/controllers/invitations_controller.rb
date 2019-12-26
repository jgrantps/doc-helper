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
    np = new_user_params
    cp = np[:positions_attributes]["0"][:company_attributes] 
    if !!cp
      cp[:creator] = current_user
      np.merge(cp)
    end
    new_user_params = np
    
  end

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:password, :password_confirmation, :invitation_token, :name, :url, :username, :creator => current_user.id])
  end 

  def new_user_params
    params.require(:user).permit(:name, :role, :email, :url, positions_attributes: [:title, :company_id, company_attributes: [:name]])
  end
end