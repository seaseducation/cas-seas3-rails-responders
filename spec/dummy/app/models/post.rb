class Post < ActiveRecord::Base
  include CasSeas3RailsResponders2::Models::Filterable
  belongs_to :user
  filter_attributes %w(title body)
end