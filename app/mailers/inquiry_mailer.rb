class InquiryMailer < ApplicationMailer
	def send_mail(inquiry)
		@inquiry = inquiry
		mail(
			from: 'nakamuraren1021@gmail.com',
			to: 'ren1021lol@gmail.com',
			subject:'お問い合わせ通知'
		)
	end
end
