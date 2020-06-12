require 'rest_client'

module MailgunApiRails
  class Delivery
    attr_accessor :settings

    def initialize(settings)
      self.settings = settings
    end

    ## Config options
    def sender
      self.settings[:sender]
    end

    def domain
      self.settings[:domain]
    end

    def api_key
      self.settings[:api_key]
    end

    def api_base_url
      self.settings[:api_base_url]
    end

    ## Action mailer call
    def deliver!(mail)
      ## Map mail values to Mailgun request
      RestClient.post "https://api:#{api_key}@#{api_base_url}/#{domain}/messages",
        from:    mail.from,
        to:      mail.to,
        subject: mail.subject,
        text:    mail.multipart? ? (mail.text_part ? mail.text_part.body.decoded : nil) : mail.body.decoded,
        html:    mail.body.decoded
    end
  end
end

ActionMailer::Base.add_delivery_method :mailgun, MailgunApiRails::Delivery