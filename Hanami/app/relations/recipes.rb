# frozen_string_literal: true

module RecepiesDz
  module Relations
    class Recipes < RecepiesDz::DB::Relation
      schema :recipes, infer: true
    end
  end
end
