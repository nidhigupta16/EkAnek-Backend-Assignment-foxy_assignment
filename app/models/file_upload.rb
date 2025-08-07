class FileUpload < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  validates :file, attached: true, size: { less_than: 1.gigabyte }

  before_create :generate_slug

  private

  def generate_slug
    self.shared_slug = SecureRandom.hex(5)
  end
end
