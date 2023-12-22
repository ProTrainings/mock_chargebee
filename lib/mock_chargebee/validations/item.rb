# frozen_string_literal: true

module MockChargebee
  module Validations
    module ItemPrice
      class CreateParams < Base
        REQUIRED_KEYS = %w[id name item_id currency_code]
      end
    end
  end
end
