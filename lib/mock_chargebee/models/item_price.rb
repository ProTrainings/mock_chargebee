# frozen_string_literal: true

module MockChargebee
  module Models
    class ItemPrice < Base
      RESOURCE_ID_PREFIX = 'item_price'

      load_fixtures :item_price

      def self.find(id)
        repositories.item_prices.fetch(id)
      end

      def self.create(params)
        already_exists!(params['id']) if already_exists?(params['id'])

        Validations::ItemPrice::CreateParams.validate_required(params)

        params['id'] ||= unique_id
        item_price = item_price_fixture.merge(params)
        repositories.item_prices.store(item_price['id'], item_price)

        item_price
      end

      def self.already_exists?(id)
        return false if id.nil?

        repositories.item_prices[id].present?
      end
    end
  end
end
