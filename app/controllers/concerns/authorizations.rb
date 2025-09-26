module Authorizations
  extend ActiveSupport::Concern

  included do
    before_action :authorize!
  end

  private

  def authorize!
    redirect_to(root_path, status: :see_other) unless allowed?
  end

  def allowed?
    raise NotImplementedError, "You must implement #allowed? method in #{self.class}"
  end
end
