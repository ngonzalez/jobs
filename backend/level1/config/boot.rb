ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.

require File.expand_path('../config/config.rb', __dir__)
require File.expand_path('../config/types.rb', __dir__)
