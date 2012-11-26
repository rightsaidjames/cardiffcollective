class UserMailer < ActionMailer::Base

  def contact_email(from, to, message)
    @from    = from
    @message = message

    mail to: to.email,
         bcc: from.email,
         from: %{"#{ from.name }" <#{ from.email }>},
         reply_to: from.email,
         subject: "#{ from.name } wants to get in touch"
  end

end
