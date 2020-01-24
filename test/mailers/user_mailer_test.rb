require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "project_expired_notice" do
    mail = UserMailer.project_expired_notice
    assert_equal "Project expired notice", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
