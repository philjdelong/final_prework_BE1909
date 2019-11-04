require'./test/test_helper'

class CompanyTest < Minitest::Test

  def setup
    @coca_cola = Company.new("Coca-Cola")
    @customer_service = Department.new("Customer Service")
    @accounting = Department.new("Accounting")
    @sales = Department.new("Sales")
    @aurora = Employee.new(
      {
        name: "Aurora",
        age: "22",
        salary: "100000"
        }
      )
    @bobbi = Employee.new(
      {
        name: "Bobbi Jaeger",
        age: "30",
        salary: "100000"
        }
      )
    @aaron = Employee.new(
      {
        name: "Aaron Tanaka",
        age: "25",
        salary: "90000"
        }
      )
  end

  def test_it_exists
    assert_instance_of Company, @coca_cola
  end

  def test_it_has_a_name
    assert_equal "Coca-Cola", @coca_cola.name
  end

  def test_it_has_multiple_departments
    assert_equal [], @coca_cola.departments
    @coca_cola.add_departments(@customer_service)
    assert_equal [@customer_service], @coca_cola.departments
  end

  def test_it_can_list_all_employees
    @coca_cola.add_departments(@customer_service)
    @customer_service.hire(@bobbi)
    @customer_service.hire(@aaron)
    @customer_service.hire(@aurora)
    assert_equal [@bobbi, @aaron, @aurora], @coca_cola.employees
  end

  def test_it_can_calculate_average_age_of_employees
    @coca_cola.add_departments(@customer_service)
    @customer_service.hire(@bobbi)
    @customer_service.hire(@aaron)
    @customer_service.hire(@aurora)
    assert_equal 25.67, @coca_cola.employees_average_age
  end

  def test_it_can_calculate_total_age_of_employees
    @coca_cola.add_departments(@customer_service)
    @customer_service.hire(@bobbi)
    @customer_service.hire(@aaron)
    @customer_service.hire(@aurora)
    assert_equal 77, @coca_cola.total_ages
  end
end
