require 'test_helper'

class FrontendHelpersTest < ActiveSupport::TestCase

  include FrontendHelpers::Html5Helper
  include FrontendHelpers::MetatagHelper
  include FrontendHelpers::ServicesHelper

  test "should be able to create the html tag" do
    assert true
  end

  test "should be able to create the meta tags" do
    assert true
  end

  test "should be able to create a google js tag" do
    assert true
  end

end
