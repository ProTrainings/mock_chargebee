# frozen_string_literal: true

module MockChargebee
  module Validations
    module Webhooks
      class EventAttributes
        ALLOWED_KEYS = %w[id occurred_at source user api_version webhooks].freeze

        def self.validate_allowed(attributes)
          attributes.each_key do |key|
            raise InvalidEventAttribute, key unless ALLOWED_KEYS.include?(key)
          end
        end
      end
    end
  end
end
