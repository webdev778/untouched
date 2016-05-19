class Notifier < ApplicationMailer

  def enquiry(enquiry)
    @enquiry = enquiry
    mail from: "#{enquiry.name} <#{enquiry.email}>", subject: enquiry.unit.development.address, to: [ 'sasha@untouched.co' ]
  end

end
