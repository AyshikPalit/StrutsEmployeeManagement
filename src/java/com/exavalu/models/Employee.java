/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.services.APIService;
import com.exavalu.services.EmployeeService;
import com.exavalu.services.LoginService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;
import org.json.simple.parser.ParseException;

/**
 *
 * @author Ayshik Palit
 */
public class Employee extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

    private String employeeId;
    private String firstName ;
    private String lastName ;
    private String phoneNo ;
    private String address ;
    private String gender ;
    private String age ;
    private String departmentId ;
    private String roleId ;
    private String basicSalary ;
    private String carAllowance;
    private String departmentName ;
    private String roleName ;

    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getBasicSalary() {
        return basicSalary;
    }

    public void setBasicSalary(String basicSalary) {
        this.basicSalary = basicSalary;
    }

    public String getCarAllowance() {
        return carAllowance;
    }

    public void setCarAllowance(String carAllowance) {
        this.carAllowance = carAllowance;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

    private ApplicationMap map = (ApplicationMap) ActionContext.getContext().getApplication();

    @Override
    public void setApplication(Map<String, Object> application) {
        map = (ApplicationMap) application;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }
    
    
    public String addEmployee() throws IOException, SQLException {
        String result = "FAILURE";
        
        Employee emp = new Employee();
        
        emp.setFirstName(firstName);
        emp.setLastName(lastName);
        emp.setAddress(address);
        emp.setPhoneNo(phoneNo);
        emp.setGender(gender);
        emp.setAge(age);
        emp.setDepartmentId(departmentId);
        emp.setRoleId(roleId);
        emp.setBasicSalary(basicSalary);
        emp.setCarAllowance(carAllowance);
        
        boolean res = EmployeeService.addEmployee(emp);
        ArrayList empList = EmployeeService.getAllEmployees();
       
        if (res) {
            sessionMap.put("EmpList", empList);
            result = "SUCCESS";
        }
        return result;
    }
    
    public String searchEmployee() throws Exception {
        String result = "FAILURE";
        ArrayList empList = EmployeeService.searchEmployee(firstName,lastName, gender, departmentName, roleName);
  
        if (!empList.isEmpty()) {
            sessionMap.put("EmpList", empList);
            result = "SUCCESS";
        }
        return result;
    }
    
    public String editEmployee() throws Exception {
        String result = "FAILURE";
        Employee emp = EmployeeService.getEmployee(employeeId);
        if (employeeId != null) {
            sessionMap.put("Emp", emp);
            result = "SUCCESS";
        }
        return result;
    }

    public String saveEmployee() throws Exception {
        String res = "FAILURE";
        Employee emp = new Employee();
        emp.setEmployeeId(employeeId);
        emp.setFirstName(firstName);
        emp.setLastName(lastName);
        emp.setAddress(address);
        emp.setPhoneNo(phoneNo);
        emp.setGender(gender);
        emp.setAge(age);
        emp.setDepartmentId(departmentId);
        emp.setRoleId(roleId);
        emp.setBasicSalary(basicSalary);
        emp.setCarAllowance(carAllowance);
        

        boolean result = EmployeeService.updateEmployee(emp, employeeId);
        ArrayList empList = EmployeeService.getAllEmployees();
        if (result) {
            sessionMap.put("EmpList", empList);
            res = "SUCCESS";
        } else {
            sessionMap.put("Emp", emp);
        }
        return res;
    }
        public String deleteEmployee() throws IOException, SQLException {
        String res = "FAILURE";
        boolean result = EmployeeService.deleteEmployee(employeeId);
        ArrayList empList = EmployeeService.getAllEmployees();
        if (result) {
            sessionMap.put("EmpList", empList);
            res = "SUCCESS";
        }
        return res;
    }
    
        public String getDataFromAPI() throws ParseException, java.text.ParseException{
        String result = "FAILURE";
        ArrayList apiUsers = APIService.consumeDataFromAPI();
        APIUser apiUser = new APIUser();
        boolean res = APIService.insertDataInDB(apiUsers);
        if(!apiUsers.isEmpty()){
            result = "SUCCESS";
            //String successMsg = "Entered API Data into Database!";
            sessionMap.put("APIUsers", apiUsers);
            sessionMap.put("APIUser", apiUser);
            return result;
        }
        return result;
    }
        
    public String showEmployee() throws Exception {
        String res = "FAILURE";
        ArrayList empList = EmployeeService.getAllEmployees();
        
        if (!empList.isEmpty()) {
            sessionMap.put("EmpList",empList);
            res = "SUCCESS";
        }
        else {
            String empMsg = "Problem in fetching Employee List";
            sessionMap.put("EmpMsg", empMsg);
        }
        return res;
    }
}
