# frozen_string_literal: true

module MockChargebee
  module RequestHandlers
    class Customers < Base
      private

      def post
        customer = Models::Customer.create(params)
        { customer: }
      end

      def get
        customer = Models::Customer.find(id)
        { customer: }
      end

      def post_delete
        customer = Models::Customer.delete(id)

        { customer: }
      end

      def post_subscriptions
        customer = Models::Customer.find(id)
        subscription = Models::Subscription.create_for_customer(customer, params)

        { subscription:, customer: }
      end

      def post_update_billing_info
        customer = Models::Customer.update(id, params)

        { customer: }
      end
    end
  end
end
