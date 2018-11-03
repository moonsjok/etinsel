class Chat < ApplicationRecord
  validates :message, presence:true, allow_blank:false
end
