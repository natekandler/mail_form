module MailForm
  class Notifier < ActionMailer::Base
    append_view_path("lib/views")

    def contact(mail_form)
      @mail_form = mail_form
      mail(mail_form.headers)
    end
  end
end