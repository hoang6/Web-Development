class User < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true

  has_many(
     :submitted_urls,
     class_name: 'ShorternedUrl',
     foreign_key: :submitter_id,
     primary_key: :id
  )

  has_many(
    :visits,
    class_name: 'Visit',
    foreign_key: :visitor_id,
    primary_key: :id
  )

  def self.create_user!(email)
    User.create!(
      email: email
    )
  end

end
