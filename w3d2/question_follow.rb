class QuestionFollow
  attr_accessor :id, :question_id, :user_id

  def initialize(options = {})
    @id, @question_id, @user_id =
      options.values_at('id', 'question_id', 'user_id')
  end

  def self.find_by_id(id)
    question_follow_data =QuestionsDatabase.execute(<<-SQL, id: id)
    SELECT
      *
    FROM
      question_follows
    WHERE
      question_follows.id = id
    SQL

    QuestionFollow.new(question_follow_data)
  end

  def self.followers_for_question_id(question_id)

  end
end
