module MockChargebee
  module RequestHandlers
    class ItemPrices < Base
      private

      def post
        item_price = Models::ItemPrice.create(params)
        { item_price: item_price }
      end

      def get
        item_price = Models::ItemPrice.find(id)
        { item_price: item_price }
      end
    end
  end
end
