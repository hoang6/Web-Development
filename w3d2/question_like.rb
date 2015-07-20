class QuestionLike
  attr_accessor :id, :question_id, :user_id

  def initialize(options = {})
    @id, @question_id, @user_id =
      options.values_at('id', 'question_id', 'user_id')
  end

  def self.find_by_id(id)
    question_likes_data = <<-SQL
    SELECT
      *
    FROM
      question_likes
    WHERE
      question_likes.id = id
    SQL

    QuestionLike.new(question_likes_data)
  end
end
