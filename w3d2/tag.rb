class Tag
  attr_accessor :id, :name

  def initialize(options = {})
    @id, @name =
      options.values_at('id', 'name')
  end

  def self.find_by_id(id)
    tag_data = <<-SQL
    SELECT
      *
    FROM
      users
    WHERE
      users.id = id
    SQL

    Tag.new(tag_data)
  end

end
