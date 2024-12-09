# frozen_string_literal: true

module Dz
  class Routes < Hanami::Routes
    get "/", to: "main.index"
  end
end
