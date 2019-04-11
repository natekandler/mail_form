class SampleMail < MailForm::Base
  attributes :name, :email, :nickname
  validates :nickname, absence: {message: "is invalid"}
end