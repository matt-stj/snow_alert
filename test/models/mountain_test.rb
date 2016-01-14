require 'test_helper'

class MountainTest < ActiveSupport::TestCase
  should have_many(:favorites)
  should have_many(:users)
end
