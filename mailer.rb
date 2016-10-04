require 'mailgun'
class Mailer

ENV['key']='key-3c2638b7abcb409fc50100a9778eb936'
ENV['domain']= 'sandboxae24e2ff954d4b43ac75e97a23dbac75.mailgun.org'

	def self.send_email(to)
		begin
			mg_client = Mailgun::Client.new(ENV['key'], 'bin.mailgun.net', 'd82eaee5', ssl = false)
			message_params =  { to:  to, subject: 'StudySoup!', text: 'This is StudySoup message!', campaign_id: "7"}
			mg_client.send_message ENV['domain'], message_params
			puts "Message Sent"
		rescue
			puts "Unable to send mail! Please try again"
		end
	end

	def self.check_suppressions(email)
		mg_client = Mailgun::Client.new(ENV['key'])
		domain = ENV['domain']
		response = []
		begin
			unsubscribes = mg_client.get "#{domain}/unsubscribes/#{email}"
			response << "UNSUBSCRIBED!"
		rescue
			response << "Not unsubscribed"
		end
		begin
			complaints = mg_client.get "#{domain}/complaints/#{email}"
			response = "COMPLAINED!"
		rescue
			response << "No complaints"
		end
		begin
			bounces = mg_client.get "#{domain}/bounces/#{email}"
			response << "BOUNCED!"
		rescue
			response << "No bounces"
		end
		puts response
	end
end
