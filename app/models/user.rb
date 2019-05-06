class User < ApplicationRecord
      validates :User_name, uniqueness: true, :presence => true
      validates_format_of :Email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      validates :Password, :presence => true,
                :confirmation => true,
                :length => {:within => 6..8}
      validates_confirmation_of :Password     
      validates :Mobile_number,
                :numericality => {only_integer: true },
                :length => { is: 10 }
      validates :Gender, 
                :numericality => false
      validates :Confirm_password,:presence => true
      

      has_and_belongs_to_many :courses, -> { distinct }

      validates_associated :courses
      #validates_uniqueness_of :course
      #validates :courses, presence: true, uniqueness:true

      has_attached_file :photo, styles: { large:"600x600", medium: "300x300>", thumb: "100x100>" }
      #validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
      #validates_attachment :photo, presence: true, content_type: { content_type: "image/jpeg" }, size: { in: 0..10.kilobytes }
      validates_attachment :photo, :content_type => { :content_type => /image/, :message => "photo must be an image" }, :size => { :in => 0..10.kilobytes, :message => "photo must be less than 10 kilobytes in size" }


end