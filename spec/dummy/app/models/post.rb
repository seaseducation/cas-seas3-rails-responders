class Post < ActiveRecord::Base
  include CasSeas3RailsResponders::Models::Filterable
  belongs_to :user
  filter_attributes %w(title body)
end