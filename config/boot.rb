ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

#いちいち rails s -b 0.0.0.0 としなくてもrails sで簡潔させるために実装。
#http://sunday150.hatenablog.com/entry/2016/05/06/022113
require 'rails/commands/server'
module Rails
  class Server
    def default_options
      super.merge(Host:  '0.0.0.0', Port: 3000)
    end
  end
end
