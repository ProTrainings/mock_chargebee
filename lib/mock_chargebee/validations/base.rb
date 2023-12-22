# frozen_string_literal: true

module MockChargebee
  module Validations
    class Base
      def self.validate_required(params)
        self::REQUIRED_KEYS.each do |required_key|
          unless params.key?(required_key)
            raise ChargeBee::InvalidRequestError.new(400,
                                                     "Required key missing: #{required_key}")
          end
        end
      end
    end
  end
end
