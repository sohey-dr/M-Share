# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
require 'carrierwave/orm/activerecord' # 行末にこれを追加
