class Mailer < ActionMailer::Base
  default from: %{"InstaNinja" <info@pinchthelook.com>}

  def error_notification(error, *deactivation_time)
    @error = error
    @time = deactivation_time if deactivation_time

    mail(
      to: "info@pinchthelook.com",
      subject: "Something went wrong"
    )
  end
end
