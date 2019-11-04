class Company
  attr_reader :name, :departments

  def initialize(name)
    @name = name
    @departments = []
  end

  def add_departments(department)
    @departments << department
  end

  def employees
    employee_list = []
    @departments.each do |department|
      employee_list << department.employees
    end
    employee_list.flatten
  end

  def employees_average_age
    (total_ages / employees.length.to_f).round(2)
  end

  def total_ages
    all_ages = 0
    employees.each do |employee|
      all_ages += employee.age.to_i
    end
    all_ages
  end
end
