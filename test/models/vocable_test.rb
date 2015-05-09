require 'test_helper'

class VocableTest < ActiveSupport::TestCase
 should belong_to(:unit)
 should validate_presence_of(:swedish)
 should validate_presence_of(:english)
end
