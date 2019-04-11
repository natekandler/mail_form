require "mail_form/railtie"

module MailForm
  autoload :Base, "mail_form/base"
  autoload :Notifier, "mail_form/notifier"
  autoload :Validators, 'mail_form/validators'
end
