module Cb
  module Utils
    class ResponseArrayExtractor

      def self.extract(response_hash, key, singular_key = nil)
        self.new(response_hash, key, singular_key).extract
      end

      def initialize(response_hash, key, singular_key)
        @response_hash = response_hash
        @key = key
        @singular_key = singular_key || key[0..key.length-2]
      end

      def extract
        if response_has_collection?
          extract_array_from_collection
        else
          []
        end
      end

      private

      def response_has_collection?
        !@response_hash[@key].nil? && !@response_hash[@key][@singular_key].nil?
      end

      def extract_array_from_collection
        if @response_hash[@key][@singular_key].is_a?(Array)
          @response_hash[@key][@singular_key]
        else
          [ @response_hash[@key][@singular_key] ]
        end
      end

    end
  end
end