# Copyright 2015 CareerBuilder, LLC
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
require_relative 'base'
module Cb
  module Clients
    class CoverLetters < Base
      def self.get(*args)
        json = cb_client.cb_get(Cb.configuration.uri_cover_letters,
                                headers: CoverLetters.headers(args))
        JSON.parse(json, symbolize_names: true)
      end

      def self.create(*args)
        json = cb_client.cb_put(Cb.configuration.uri_cover_letters,
                                body: CoverLetter.body(args),
                                headers: CoverLetters.headers(args))
        JSON.parse(json, symbolize_names: true)
      end

      def self.delete(*args)
        uri = "#{ Cb.configuration.uri_cover_letters }/#{ args[:id] }"
        json = cb_client.cb_delete(uri,
                                   body: CoverLetter.body(args),
                                   headers: CoverLetters.headers(args))
        JSON.parse(json, symbolize_names: true)
      end

      def self.update(*args)
        uri = "#{ Cb.configuration.uri_cover_letters }/#{ args[:id] }"
        json = cb_client.cb_delete(uri,
                                   body: CoverLetter.body(args),
                                   headers: CoverLetters.headers(args))
        JSON.parse(json, symbolize_names: true)
      end

      private
      def headers(*args)
        {
            'Accept' => 'application/json;',
            'Authorization' => "Bearer #{ args[:oauth_token] }"
        }
      end

      def body(*args)
        body = Hash.new
        body[:id] = args[:id] if args[:id]
        body[:text] = args[:text] if args[:text]
        body[:name] = args[:name] if args[:name]
        body.to_json
      end
    end
  end
end
