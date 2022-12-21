require "test_helper"

class Auronix::RubyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Auronix::Ruby::VERSION
  end
end
