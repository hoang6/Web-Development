require_relative 'question_like'
require_relative 'question_like'
require_relative 'question_follow'
require_relative 'user'

class Question
  def self.find_by_id(id)
    question_data = QuestionDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.id = ?
    SQL

    Question.new(question_data);
  end

  def initialize(options)
    @id, @title, @body, @author_id =
      options.values_at('id', 'title', 'body', 'author_id');
  end

  def self.find_by_author_id(author_id)
    questions_data = QuestionDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.author_id = ?
    SQL

    questions_data.map { |question_data| Question.new(question_data) }
  end

  def author
    User.find_by_author_id(id)
  end

  def replies
    Reply.find_by_question_id(id)
  end

  def followers
    QuestionFollow.followers_for_question_id(id)
  end

  def most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def likers
    QuestionLike.likers_for_question_id(id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(id)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

end
