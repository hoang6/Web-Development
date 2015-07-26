class QuestionFollow
  def self.find_by_id(id)
    question_follow_data = QuestionDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        question_follows.id = ?
    SQL

    QuestionFollow.new(question_follow_data);
  end

  def initialize(options)
    @id, @author_id, @question_id =
      options.values_at('id', 'author_id', 'question_id');
  end

  def self.followers_for_question_id(question_id)
    users_data = QuestionDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        -- follower_id
        users.*
      FROM
        users
      JOIN
        question_follows ON question_follows.follower_id = users.id
      WHERE
        question_follows.question_id = ?
    SQL

    # followers_data.map { |follower_data| User.find_by_id(follower_data) }
    users_data.map { |user_data| User.new(user_data) }
  end

  def self.followed_questions_for_user_id(user_id)
    questions_data = QuestionDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows ON question_follows.question_id = questions.id
      WHERE
        question_follows.user_id = ?
    SQL

    questions_data.map { |question_data| Question.new(question_data) }
  end

  def self.most_followed_questions(n)
    questions_data = QuestionDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows ON question_follows.question_id = questions.id
      GROUP BY
        question_follows.question_id
      ORDER BY
        COUNT(question_follows.author_id)
      LIMIT
        n
    SQL

    questions_data.map { |question_data| Question.new(question_data) }
  end

end
