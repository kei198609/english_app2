module RequestSpecHelper

  include Warden::Test::Helpers

  def self.included(base)
    base.before(:each) { Warden.test_mode! }
    base.after(:each) { Warden.test_reset! }
  end

  def sign_in(resource)
    login_as(resource, scope: warden_scope(resource))
  end

  def sign_out(resource)
    logout(warden_scope(resource))
  end

  def authenticated_header(user)
    headers = user.create_new_auth_token
    {
      'access-token' => headers['access-token'],
      'token-type' => 'Bearer',
      'client' => headers['client'],
      'expiry' => headers['expiry'],
      'uid' => user.uid
    }
  end

  RSpec.configure do |config|
    config.include RequestSpecHelper, type: :request
  end

  def json
    JSON.parse(response.body)
  end

  private

  def warden_scope(resource)
    resource.class.name.underscore.to_sym
  end

end