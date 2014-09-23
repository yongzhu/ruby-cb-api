require_relative '../base'

module Cb
  module Requests
    module Resumes
      class List < Base
        def endpoint_uri
          Cb.configuration.uri_resume_list
        end

        def http_method
          :get
        end

        def query
          {
              DeveloperKey: Cb.configuration.dev_key,
              HostSite: args[:host_site] || '',
              OAuthToken: args[:oauth_token]
          }
        end
      end
    end
  end
end
