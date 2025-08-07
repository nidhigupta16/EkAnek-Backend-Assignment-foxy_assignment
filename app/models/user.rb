class User < ApplicationRecord
  has_secure_password
  has_many :file_uploads
end
