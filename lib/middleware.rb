module SidekiqMeteredExceptions
  class Middleware

    def call(worker, job, queue)
      begin
        yield
      rescue Exception => ex
        # report a predictable error class on the first failure, or if a user
        # triggers a retry via the gui.
        if job['retry_count'] == nil || job['retry_count'] < 0
          raise SidekiqMeteredExceptions::MeteredError.new(ex.inspect)
        else
          raise(ex)
        end
      end
    end
  end
end
