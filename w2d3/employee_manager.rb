class Employee
  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :team

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @team = []
  end

  def add_team_member(employee)
    @team << employee
  end

  def bonus(multiplier)
    total_team_salary * multiplier
  end

  def total_team_salary
    total_salary = 0

    @team.each do |employee|
      if employee.is_a?(Manager)
        total_salary += employee.total_team_salary
      end
      total_salary += employee.salary
    end

    total_salary
  end
end

ned = Manager.new('ned', 'founder', 1_000_000, nil)
darren = Manager.new('darren', 'head TA', 78_000, ned)
shawna = Employee.new('shawna', 'TA', 12_000, darren)
david = Employee.new('david', 'TA', 10_000, darren)

ned.add_team_member(darren)
darren.add_team_member(shawna)
darren.add_team_member(david)

puts ned.bonus(5)
puts darren.bonus(4)
puts david.bonus(3)
