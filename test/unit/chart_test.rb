require 'test_helper'

class ChartTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Chart.new.valid?
  end
end
