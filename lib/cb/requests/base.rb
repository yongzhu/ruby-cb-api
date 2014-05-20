module Cb
  module Requests
    class Base

      def initialize(argument_hash)
        @args = argument_hash || {}
      end

      def endpoint_uri
        raise NotImplementedError.new __method__
      end

      def http_method
        raise NotImplementedError.new __method__
      end

      def query
        nil
      end

      def headers
        nil
      end

      def body
        nil
      end
    end
  end
end