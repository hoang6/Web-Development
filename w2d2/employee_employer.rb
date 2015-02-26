class Employee
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end
end


class Manager < Employee
  def initilize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def bonus(multiplier)
    bonus = multiplier * @employees.inject(0) { |sum, employee| sum += employee.salary }
  end
end


ned = Manager.new('Ned', 'Founder', 100000, nil)
darren = Employee.new('Darren', 'TA Manager', 78000, ned )
shawna = Employee.new('Shawna', 'TA', 12000, darren )
david = Employee.new('David', 'TA', 10000, darren )

ned.add_employee(darren)
ned.add_employee(shawna)
ned.add_employee(david)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
