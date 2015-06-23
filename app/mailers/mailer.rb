class Mailer < ApplicationMailer

  default from: "from@example.com"

def welcome_email(reader)
    @reader = reader
    mail(to: @reader.email, subject: 'Welcome!')
  end
end
