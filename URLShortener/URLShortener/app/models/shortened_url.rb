class ShortenedUrl < ActiveRecord::Base
  # validates :long_url, :presence => true
  # validates :short_url, :presence => true, :uniqueness => true
  # validates :submitter_id, :presence => true
  validates :long_url, :short_url, :submitter_id, :presence => true
  validates :short_url, :uniqueness => true

  belongs_to(
    :submitter,
    class_name: 'User',
    foreign_key: :submitter_id,
    primary_key: :id
  )

  def self.random_code
    # begin
    #   random_code = SecureRandom.urlsafe_base64(16)
    # end while (ShortenedUrl.exists?(short_url: random_code) == false)

    # return random_code
    # end

    loop do
      random_code = SecureRandom.urlsafe_base64(16)
      return random_code unless ShortenedUrl.exists?(short_url: random_code)
    end
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(
      submitter_id: user.id,
      long_url: long_url,
      short_url: ShortenedUrl.random_code
    )
  end
end
