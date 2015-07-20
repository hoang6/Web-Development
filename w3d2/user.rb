class User
  attr_accessor :id, :fname, :lname

  def initialize(options = {})
    @id, @fname, @lname =
      options.values_at('id', 'fname', 'lname')
  end
  
  def self.find_by_id(id)
    user_data = QuestionsDatabase.execute(<<-SQL, id: id)
    SELECT
      *
    FROM
      users
    WHERE
      users.id = id
    SQL

    User.new(user_data)
  end

  def self.find_by_name(fname, lname)
    user_data = QuestionsDatabase.execute(<<-SQL, lname: lname, fname: fname)
    SELECT
      *
    FROM
      users
    WHERE
      users.lname = :lname AND users.fname = :fname
    SQL
  end

  def authored_questions
    Question.find_author_id(id)
  end

  def authored_replies
    Reply.find_by_user_id(id)
  end
end
