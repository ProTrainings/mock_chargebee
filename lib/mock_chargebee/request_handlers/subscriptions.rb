# frozen_string_literal: true

module MockChargebee
  module RequestHandlers
    class Subscriptions < Base
      load_fixtures :subscription_create_response,
                    :subscription_cancel_response,
                    :subscription_reactivate_response

      private

      def post
        if id.nil?
          subscription, customer = Models::Subscription.create(params)
          subscription_create_response_fixture.merge(subscription:, customer:)
        else
          subscription = Models::Subscription.update(id, params)

          { subscription: }
        end
      end

      def post_cancel
        subscription = Models::Subscription.cancel(id, params)
        customer = Models::Customer.find(subscription['customer_id'])

        subscription_cancel_response_fixture.merge(subscription:, customer:)
      end

      def post_reactivate
        subscription = Models::Subscription.reactivate(id, params)
        customer = Models::Customer.find(subscription['customer_id'])

        subscription_reactivate_response_fixture.merge(subscription:, customer:)
      end

      def get
        subscription = Models::Subscription.find(id)
        { subscription: }
      end
    end
  end
end
