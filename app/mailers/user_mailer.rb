# frozen_string_literal: true

# user mailer
class UserMailer < ApplicationMailer
  def welcome_email(audition)
    @audition = audition
    mail(to: @audition.email, subject: 'Welcome to AudioSocket')
  end

  def rejected_email(audition)
    @audition = audition
    mail(to: @audition.email, subject: 'Welcome to AudioSocket')
  end
end
