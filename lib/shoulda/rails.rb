require 'rubygems'
require 'active_support'
require 'shoulda'

require 'shoulda/active_record'     if defined? ActiveRecord::Base
require 'shoulda/action_controller' if defined? ActionController::Base
require 'shoulda/action_view'       if defined? ActionView::Base
require 'shoulda/action_mailer'     if defined? ActionMailer::Base

root = if defined?(Rails.root) && Rails.root
         Rails.root
       else
         RAILS_ROOT
       end

# load in the 3rd party macros from vendorized plugins and gems
Shoulda.autoload_macros root, File.join("vendor", "{plugins,gems}", "*")
