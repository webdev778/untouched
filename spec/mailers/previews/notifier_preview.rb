# Preview all emails at http://localhost:3000/rails/mailers/notifier
class NotifierPreview < ActionMailer::Preview

  def enquiry
    Notifier.enquiry(Enquiry.first)
  end

end
