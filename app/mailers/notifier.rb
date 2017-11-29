class Notifier < ApplicationMailer

  def enquiry(enquiry)
    @enquiry = enquiry
    mail from: "#{enquiry.name} <#{enquiry.email}>", subject: enquiry.unit.development.address, to: [ 'sasha@untouched.co' ]
  end

  def try_it_free(email)
    @email = email
    mail from: "#{email}", subject: "Try It Free Email", to: [ 'sasha@untouched.co' ]
  end

end
