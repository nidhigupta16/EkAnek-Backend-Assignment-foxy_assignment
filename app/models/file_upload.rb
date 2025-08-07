class FileUpload < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  before_create :generate_slug

  private

  def generate_slug
    self.shared_slug = SecureRandom.hex(5)
  end
end
