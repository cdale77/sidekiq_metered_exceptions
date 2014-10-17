module SidekiqMeteredExceptions
  class MeteredError < StandardError
    def initialize(msg = "Metered exception")
      super
    end
  end
end