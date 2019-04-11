class SampleMail < MailForm::Base
  attributes :name, :email, :nickname
  validates :nickname, absence: {message: "is invalid"}

  before_deliver :action_before_deliver

  def action_before_deliver
    evaluated_callbacks << :before
  end

  after_deliver do
    evaluated_callbacks << :after
  end

  def evaluated_callbacks
    @evaluated_callbacks ||= []
  end
end