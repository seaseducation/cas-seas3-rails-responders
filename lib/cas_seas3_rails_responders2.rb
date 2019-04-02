# require "cas_seas3_rails_responders2/railtie"
#
# module CasSeas3RailsResponders2
#   # Your code goes here...
# end


require 'rails/all'
require 'responders'

require "cas_seas3_rails_responders2/railtie"
require "cas_seas3_rails_responders2/version"

require 'cas_seas3_rails_responders2/responders/display_resource_on_put_delete_responder'
require 'cas_seas3_rails_responders2/responders/http_cache_responder'
require 'cas_seas3_rails_responders2/responders/ids_filter_responder'
require 'cas_seas3_rails_responders2/responders/nested_association_responder'
require 'cas_seas3_rails_responders2/responders/pagination_responder'
require 'cas_seas3_rails_responders2/responders/sort_responder'
require 'cas_seas3_rails_responders2/responders/search_responder'
require 'cas_seas3_rails_responders2/responder'
require 'cas_seas3_rails_responders2/models/filterable'

module CasSeas3RailsResponders2
  # Your code goes here...
end

