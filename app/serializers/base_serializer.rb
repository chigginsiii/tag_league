class BaseSerializer
  include FastJsonapi::ObjectSerializer
  class << self
    include Rails.application.routes.url_helpers
  end
end
