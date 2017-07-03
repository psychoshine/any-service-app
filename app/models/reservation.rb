class Reservation < ApplicationRecord
	belongs_to :booking_post
	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
	validates :name, :email, :phone_number, :start, :reservation_time, presence: true 

	validate :date_and_time_cannot_be_in_the_past

  

	private

		def date_and_time_cannot_be_in_the_past
	    	if self.start.present? and self.start < Date.today
	      		errors.add(:start, "can't be in the past")
	    	end
	       	if self.reservation_time.present? and self.reservation_time < Time.now
	   		   	errors.add(:reservation_time, "can't be in the past") if (self.start.present? and self.start >= Date.today)
	    	end
	  	end
end
