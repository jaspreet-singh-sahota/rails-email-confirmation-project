require 'action_mailer'
Dir["#{File.dirname(__FILE__)}/mailgun-api-rails/*.rb"].each{|file| require file}
module MailgunApiRails end