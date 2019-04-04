class SampleMail < MailForm::Base
  attributes :name, :email

  # why did I need to move this up to base.rb?
  # def headers
  #   { to: "recipient@example.com", from: self.email }
  # end
end