# frozen_string_literal: true

module MockChargebee
  module Models
    class Item < Base
      RESOURCE_ID_PREFIX = 'item'

      load_fixtures :item

      def self.find(id)
        repositories.items.fetch(id)
      end

      def self.create(params)
        already_exists!(params['id']) if already_exists?(params['id'])

        Validations::Item::CreateParams.validate_required(params)

        params['id'] ||= unique_id
        item = item_fixture.merge(params)
        repositories.items.store(item['id'], item)

        item
      end

      def self.already_exists?(id)
        return false if id.nil?

        repositories.items[id].present?
      end
    end
  end
end
