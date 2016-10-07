require_relative "mailer"
require "test/unit"

class TestMailer < Test::Unit::TestCase

  test "should raise error if email format is incorrect" do
    assert Mailer.send_email("wrongemail") == "incorrect email format"
    assert Mailer.check_suppressions("wrongemail") == "incorrect email format"
  end

  test "should send email format if address is correct" do
    assert Mailer.send_email("test@test.com") == "success"
  end
end