module Spree
  class Fulfillment
    class Provider

      def services
        raise NotImplementedError, "#services is not supported by #{self.class.name}."
      end

      def can_fulfill?(package)
        raise NotImplementedError, "#can_fulfill? is not yet supported by #{self.class.name}."
      end

      def estimate_cost(package, service)
        raise NotImplementedError, "#package_estimate is not supported by #{self.class.name}."
      end

      def estimate_delivery_window(package, service, options)
        raise NotImplementedError, "#estimate_delivery_window is not supported by #{self.class.name}."
      end

      def fulfill(shipment, service=nil)
        raise NotImplementedError, "#fulfill is not supported by #{self.class.name}."
      end

      def refresh_fulfillment(fulfillment)
        raise NotImplementedError, "#refresh_fulfillment is not yet supported by #{self.class.name}."
      end      

      def update_fulfillment(fulfillment)
        raise NotImplementedError, "#update_fulfillment is not yet supported by #{self.class.name}."
      end

      def cancel_fulfillment(fulfillment)
        raise NotImplementedError, "#cancel_fulfillment is not yet supported by #{self.class.name}."
      end

      def update_inventory_levels(variants=nil)
        raise NotImplementedError, "#update_inventory_levels is not yet supported by #{self.class.name}."
      end

    end
  end
end