# frozen_string_literal: true

module MockChargebee
  module RequestHandlers
    class ItemPrices < Base
      private

      def post
        item_price = Models::ItemPrice.create(params)
        { item_price: }
      end

      def get
        item_price = Models::ItemPrice.find(id)
        { item_price: }
      end
    end
  end
end
