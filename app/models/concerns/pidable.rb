module PIDable
  extend ActiveSupport::Concern

  included do
    before_create :generate_pid

    def generate_pid
      self.pid = GeneratePID.call if pid.blank?
    end

    def self.find(pid)
      find_by!(pid:)
    rescue ActiveRecord::RecordNotFound
      super
    end

    def to_param = pid

    def to_key = [to_param]
  end
end
