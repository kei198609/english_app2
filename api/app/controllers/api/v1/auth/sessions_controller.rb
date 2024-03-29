class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  wrap_parameters format: []

  def guest_sign_in
    @resource = User.create_guest
    @token = @resource.create_token
    @resource.save!
    render_create_success
  end
end