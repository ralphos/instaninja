class Mailer < ActionMailer::Base
  default from: %{"InstaNinja" <wintle.ralph@gmail.com>}

  def error_notification(error)
    @error = error

    mail(
      to: "wintle.ralph@gmail.com",
      subject: "Something went wrong"
    )
  end
end
