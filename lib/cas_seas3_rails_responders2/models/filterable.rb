module CasSeas3RailsResponders2
  module Models
    module Filterable
      extend ActiveSupport::Concern

      module ClassMethods
        def filter_attributes(arg = nil)
          @filter_attributes = arg if arg
          @filter_attributes
        end

        def filter(target, *filter_attrs)
          if filter_attrs.empty?
            filter_attrs = @filter_attributes
          end

          # Code to make this work against any column
          new_target = {}
          if target.is_a?(String)
            @filter_attributes.each do |filter_attribute|
              new_target[filter_attribute] = target
            end
            target = new_target
          end

          query_chunks = filter_attrs.map do |attr|
            "#{attr} LIKE ?" if target.key?(attr)
          end.compact

          query_args = filter_attrs.map do |attr|
            "%#{target[attr]}%" if target[attr]
          end.compact

          query = query_chunks.join(' OR ')
          where(query, *query_args)
        end

        def filter0(target, *filter_attrs)
          #byebug
          if filter_attrs.empty?
            filter_attrs = @filter_attributes
          end

          filter_texts = []
          filter_attrs.each do |attr|
            filter_texts << "#{attr} like ?"
          end

          query = [filter_texts.join(' OR ')]

          # filter_texts.each do |ft|
          #   query << "%#{target[ft.to_sym]}%"
          # end

          target.to_unsafe_hash.each do |filter_column, filter_value|
            query << filter_value
          end

          byebug
          filter_texts.count.times { query << "%#{target}%" }
          #filter_texts.count.times { query << "%#{target[:body]}%" }

          # target.each do |k,v|
          #   #query <<
          #   query << v
          # end
          # byebug
          where(query)
        end
      end
    end
  end
end