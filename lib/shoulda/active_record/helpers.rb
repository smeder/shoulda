module Shoulda # :nodoc:
  module ActiveRecord # :nodoc:
    module Helpers
      def pretty_error_messages(obj) # :nodoc:
        obj.errors.map do |a, m| 
          msg = "#{a} #{m}" 
          msg << " (#{obj.send(a).inspect})" unless a.to_sym == :base
        end
      end

      # Helper method that determines the default error message used by Active
      # Record.  Works for both existing Rails 2.1 and Rails 2.2 with the newly
      # introduced I18n module used for localization.
      #
      #   default_error_message(:blank)
      #   default_error_message(:too_short, :count => 5)
      #   default_error_message(:too_long, :count => 60)
      def default_error_message(key, values = {})
        if Object.const_defined?(:I18n) # Rails >= 2.2
          # In Rails 3.0 beta the messages moved to ActiveModel which seems to have a buggy namespace for its messages
          message = I18n.translate("errors.messages.#{key}", values)
          if message.nil?
            # if the message is not a ActiveModel message try ActiveRecord
            message = I18n.translate("activerecord.errors.messages.#{key}", values)
          end
          message
        else # Rails <= 2.1.x
          ::ActiveRecord::Errors.default_error_messages[key] % values[:count]
        end
      end
    end
  end
end
