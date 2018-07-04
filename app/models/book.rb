class Book < ActiveRecord::Base
	validates :name, presence: true,
                    length: { minimum: 1 }
         belongs_to :user


         mount_uploader :attachment, AttachmentUploader 
         validates :name, presence: true 


         


end
