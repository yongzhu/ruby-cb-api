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
module Cb
  module Models
    class Application < ApiResponseModel
      class Response < ApiResponseModel
        attr_accessor :question_id, :response_text

        protected

        def required_fields
          %w(QuestionID ResponseText)
        end

        def set_model_properties
          @question_id = api_response['QuestionID']
          @response_text = api_response['ResponseText']
        end
      end
    end
  end
end
