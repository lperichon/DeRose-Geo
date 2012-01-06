class SpacialdbBase < ActiveRecord::Base
  establish_connection(::SpacialdbConnectionConfig) if Rails.env == "production"
  self.abstract_class = true
end
