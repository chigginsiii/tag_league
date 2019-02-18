# spec/support/request_spec_helper.rb
module RequestSpecHelper
  include Warden::Test::Helpers

  def self.included(base)
    base.before { Warden.test_mode! }
    base.after { Warden.test_reset! }
  end

  def sign_in(resource)
    login_as(resource, scope: warden_scope(resource))
  end

  def sign_out(resource)
    logout(warden_scope(resource))
  end

  def auth_headers(resource)
    auth = resource.create_new_auth_token

    {
      'CONTENT_TYPE': "application/json",
      'ACCEPT': "application/json",
      'Uid': auth["uid"],
      'Access-Token': auth["access-token"],
      'Client': auth["client"]
    }
  end

  private

  def warden_scope(resource)
    resource.class.name.underscore.to_sym
  end
end
