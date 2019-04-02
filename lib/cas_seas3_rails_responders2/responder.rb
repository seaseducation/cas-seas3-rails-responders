module CasSeas3RailsResponders2
  # class ApplicationController < ActionController::Base
  # end
  # Your code goes here...
  class Responder < ActionController::Responder
    prepend CasSeas3RailsResponders2::Responders::PaginationResponder
    prepend CasSeas3RailsResponders2::Responders::IdsFilterResponder
    prepend CasSeas3RailsResponders2::Responders::SortResponder
    prepend CasSeas3RailsResponders2::Responders::NestedAssociationResponder
    prepend CasSeas3RailsResponders2::Responders::DisplayResourceOnPutDeleteResponder
    prepend CasSeas3RailsResponders2::Responders::SearchResponder

    include CasSeas3RailsResponders2::Responders::HttpCacheResponder
    include ::Responders::FlashResponder

    def initialize(*)
      super
      options[:location] = nil if format == :json
    end

    def to_format
      validate!
      if errors.any?
        display({ errors: errors }, status: 400)
      else
        super
      end
    end

    def validate!
    end

    def json_resource_errors
      { errors: resource.errors.full_messages }
    end

    private
      def errors
        @_errors ||= []
      end
  end
end


