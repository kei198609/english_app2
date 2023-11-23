class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  def sign_up_params
    # params.permit(:name, :email, :password, :occupation, :password_confirmation)
    params.require(:user).permit(:name, :email, :password, :occupation, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :occupation, :avatar, :current_password, :password, :password_confirmation)
  end
end