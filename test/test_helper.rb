ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'custom/login_helper'

module ActiveSupport
  class TestCase
    parallelize(workers: :number_of_processors)
    include LoginHelper
    fixtures :all

    def generate_slug(len)
      [*('a'..'z')].sample(len).join
    end
  end
end
