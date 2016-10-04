require 'simplecov'
require "test/unit"

SimpleCov.start

require_relative "mailer"
# require 'stringio'

class TestMailer < Test::Unit::TestCase

test 'Mailgun should instantiate an HttpClient object' do
    expect {@mg_obj = Mailgun::UnitClient.new("messages")}.not_to raise_error
end











end
