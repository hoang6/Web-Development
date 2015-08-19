class Response < ActiveRecord::Base
  validates :respondent_id, :answer_choice_id, :presence => true

  belongs_to(
    :answer_choice,
    class_name: 'AnswerChoice',
    foreign_key: :answer_choice_id,
    primary_key: :id
  )

  belongs_to(
    :respondent,
    class_name: 'User',
    foreign_key: :respondent_id,
    primary_key: :id
  )

  has_one :question through: :answer_choice

  def sibling_responses
    self.question.responses
      .where(
        "(:id IS NULL) OR (responses.id != :id)",
        id: self.id
      )
  end

end
