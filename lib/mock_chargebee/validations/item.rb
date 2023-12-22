# frozen_string_literal: true

module MockChargebee
  module Validations
    module Item
      class CreateParams < Base
        REQUIRED_KEYS = %w[id name].freeze
      end
    end
  end
end
