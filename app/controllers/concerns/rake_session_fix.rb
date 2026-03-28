module RakeSessionFix
  extend ActiveSupport::Concern

  class FakeRakeSession < Hash
    def enabled?
      false
    end
  end

  included do
    before_action :set_fake_rake_session_for_devise

    private

    def set_fake_rake_session_for_devise
      request.env['rack.session'] ||= FakeRakeSession.new
    end
  end
end