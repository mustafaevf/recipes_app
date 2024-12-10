# frozen_string_literal: true

module RecepiesDz
  module Relations
    class Categories < RecepiesDz::DB::Relation
      schema :categories, infer: true do
        associations do
          has_many :recipes
        end
      end
    end
  end
end
