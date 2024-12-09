# frozen_string_literal: true

module Dz
  module Actions
    module Main
      class Index < Dz::Action
        def handle(request, response)
          response.body = "<h1>test</h1>"
        end
      end
    end
  end
end
