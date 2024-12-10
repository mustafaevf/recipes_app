# frozen_string_literal: true

module RecepiesDz
  module Repos
    class CategoryRepo < RecepiesDz::DB::Repo
      commands :create
      def all
        categories.to_a
      end
      
      def find(id)
        categories.where(id: id).one
      end

      def create(data)
        categories.command(:create).call(data)
      end

      def update(id, data)
        categories.where(id: id).update(data.to_h)
      end

      def delete(id)
        categories.where(id: id).delete
      end
    end
  end
end
