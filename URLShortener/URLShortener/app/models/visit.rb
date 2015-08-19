class Visit < ActiveRecord::Base
  validates :visitor_id, :shortened_url_id, :presence => true
  # A shortened url can be visited many times
  # validates :short_url, :uniqueness => true

  # belongs_to(
  #   :shortened_url,
  #   class_name: 'ShortenedUrl',
  #   foreign_key: :shortened_url_id,
  #   primary_key: :id
  # )

  belongs_to :shortened_url, inverse_of: :visits

  belongs_to(
    :visitor,
    class_name: 'User',
    foreign_key: :visitor_id,
    primary_key: :id
  )

  def self.record_visit!(user, shortened_url)
    Visit.create!(visitor_id: user.id, shortened_url_id: shortened_url.id)
  end
end
