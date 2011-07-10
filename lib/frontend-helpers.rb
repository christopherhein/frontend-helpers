require "frontend-helpers/html5_helper"
require "frontend-helpers/metatag_helper"
require "frontend-helpers/services_helper"
require "asset-helpers/rails"

# == Frontend Helper Module
#
# Open a basic Form Helpers module as a blank slate that
# can be extended through out the plugin for all my frontend
# helpers
#
module FrontendHelpers

end

ActionView::Base.send :include, FrontendHelpers