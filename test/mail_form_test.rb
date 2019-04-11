require 'test_helper'
require 'fixtures/sample_mail'

class MailForm::Test < ActiveSupport::TestCase
  test "sample mail has name and email as attributes" do
    sample = SampleMail.new
    sample.name = "User"
    assert_equal "User", sample.name
    sample.email = "user@example.com"
    assert_equal "user@example.com", sample.email
  end

  test "sample mail can clear attributes using clear_prefix" do
    sample = SampleMail.new
    sample.name = "User"
    sample.email = "user@example.com"
    assert_equal "User", sample.name
    assert_equal "user@example.com", sample.email
    sample.clear_name
    sample.clear_email
    assert_nil sample.name
    assert_nil sample.email
  end

  test "sample mail can ask if an attribute is present or not" do
    sample = SampleMail.new
    assert !sample.name?
    sample.name = "User"
    assert sample.name?
    sample.email = ""
    assert !sample.email?
  end

  setup do
    ActionMailer::Base.deliveries.clear
  end

  test "delivers an email with attributes" do
    sample = SampleMail.new
    # Simulate data from the form
    sample.email = "user@example.com"

    sample.deliver
    assert_equal 1, ActionMailer::Base.deliveries.size
    
    mail = ActionMailer::Base.deliveries.last
    assert_equal ["user@example.com"], mail.from

    expected_body = "Contact\r\n  Name:\r\n  \r\n  Email:\r\n  user@example.com\r\n"
    assert_match expected_body, mail.body.encoded
  end

  test "validates absence of nickname" do
    sample = SampleMail.new(nickname: "Spam")
    assert !sample.valid?
    assert_equal ["is invalid"], sample.errors[:nickname]
  end
end
