#require 'dragonfly'
require 'dragonfly/rails/images'


#app = Dragonfly[:images]
#app.configure_with(:imagemagick)
#app.configure_with(:rails)
#
#
#if (Rails.env.production?)
#  app.configure do |c|
#    c.datastore = Dragonfly::DataStorage::S3DataStore.new(
#      :bucket_name => ENV['S3_BUCKET'],
#      :access_key_id => ENV['S3_ACCESS_KEY_ID'],
#      :secret_access_key => ENV['S3_SECRET_ACCESS_KEY'],
#      :region => 'eu-west-1'
#    )
#  end
#end
#
#app.define_macro(ActiveRecord::Base, :image_accessor)