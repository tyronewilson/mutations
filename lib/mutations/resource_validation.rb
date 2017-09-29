module Mutations
  module ResourceValidation
    extend ActiveSupport::Concern
    EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    included do
      def run_resource_validations
        unless resource.valid?
          process_model_errors
        end
      end

      def process_model_errors(resource=self.resource)
        resource.errors.messages.each do |field, message|
          messages = message.join(", ")
          add_error(field, :validation_error, "#{field.to_s.humanize} #{messages}")
        end
      end

      attr_reader :resource
    end
  end
end
