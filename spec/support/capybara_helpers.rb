module CapybaraHelpers
  def eventually(timeout: Capybara.default_max_wait_time, interval: 0.2)
    Timeout.timeout(timeout) do
      next yield
    rescue RSpec::Expectations::ExpectationNotMetError, Minitest::Assertion, Capybara::ExpectationNotMet
      sleep interval
      retry
    end
  rescue Timeout::Error
    yield
  end
end
