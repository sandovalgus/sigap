require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get employees_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_url
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post employees_url, params: { employee: { active: @employee.active, address_floor: @employee.address_floor, address_floor_apartment_number: @employee.address_floor_apartment_number, address_monoblock: @employee.address_monoblock, address_number: @employee.address_number, address_street: @employee.address_street, allergies: @employee.allergies, avatar: @employee.avatar, background: @employee.background, blood_type: @employee.blood_type, category: @employee.category, city: @employee.city, clinical_analyzes: @employee.clinical_analyzes, country: @employee.country, cuil: @employee.cuil, date_of_admission: @employee.date_of_admission, document_number: @employee.document_number, document_type: @employee.document_type, email: @employee.email, email_work: @employee.email_work, function_employee: @employee.function_employee, interno_tel_work: @employee.interno_tel_work, last_name: @employee.last_name, leaving_date: @employee.leaving_date, legajo: @employee.legajo, legal_instrument: @employee.legal_instrument, location: @employee.location, making_performance: @employee.making_performance, marital_state: @employee.marital_state, name: @employee.name, name_contact: @employee.name_contact, name_social_work: @employee.name_social_work, neighborhood: @employee.neighborhood, number_partner: @employee.number_partner, other_tel: @employee.other_tel, reason: @employee.reason, relationship_of_dependency: @employee.relationship_of_dependency, state: @employee.state, suitable: @employee.suitable, tel_cel: @employee.tel_cel, tel_emergency: @employee.tel_emergency, tel_home: @employee.tel_home, tel_work: @employee.tel_work } }
    end

    assert_redirected_to employee_url(Employee.last)
  end

  test "should show employee" do
    get employee_url(@employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test "should update employee" do
    patch employee_url(@employee), params: { employee: { active: @employee.active, address_floor: @employee.address_floor, address_floor_apartment_number: @employee.address_floor_apartment_number, address_monoblock: @employee.address_monoblock, address_number: @employee.address_number, address_street: @employee.address_street, allergies: @employee.allergies, avatar: @employee.avatar, background: @employee.background, blood_type: @employee.blood_type, category: @employee.category, city: @employee.city, clinical_analyzes: @employee.clinical_analyzes, country: @employee.country, cuil: @employee.cuil, date_of_admission: @employee.date_of_admission, document_number: @employee.document_number, document_type: @employee.document_type, email: @employee.email, email_work: @employee.email_work, function_employee: @employee.function_employee, interno_tel_work: @employee.interno_tel_work, last_name: @employee.last_name, leaving_date: @employee.leaving_date, legajo: @employee.legajo, legal_instrument: @employee.legal_instrument, location: @employee.location, making_performance: @employee.making_performance, marital_state: @employee.marital_state, name: @employee.name, name_contact: @employee.name_contact, name_social_work: @employee.name_social_work, neighborhood: @employee.neighborhood, number_partner: @employee.number_partner, other_tel: @employee.other_tel, reason: @employee.reason, relationship_of_dependency: @employee.relationship_of_dependency, state: @employee.state, suitable: @employee.suitable, tel_cel: @employee.tel_cel, tel_emergency: @employee.tel_emergency, tel_home: @employee.tel_home, tel_work: @employee.tel_work } }
    assert_redirected_to employee_url(@employee)
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url
  end
end
