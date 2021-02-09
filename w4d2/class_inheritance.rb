class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    salary * multiplier
  end



end

class Manager < Employee
  attr_reader :employees
  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def bonus(multiplier)
    sum = 0
    @employees.each {|employee| sum += employee.salary}
    sum * multiplier
  end

  def add_employee(employee)
    @employees << employee
  end
end

m = Manager.new("Bob", "VP", 100, nil)
e1 = Employee.new("Taylor", "Junior VP", 50, "Bob")
e2 = Employee.new("Cristian", "Junior", 75, m)
m.add_employee(e1)
m.add_employee(e2)
m.employees.each{|el| puts el.salary }
e1.salary
p e1.bonus(0.25)
p e2.bonus(0.50)
p m.bonus(0.50)
