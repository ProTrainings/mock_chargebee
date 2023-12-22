# frozen_string_literal: true

module MockChargebee
  module RequestHandlers
    class Items < Base
      private

      def post
        item = Models::Item.create(params)
        { item: }
      end

      def get
        item = Models::Item.find(id)
        { item: }
      end
    end
  end
end
