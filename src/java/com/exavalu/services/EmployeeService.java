/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;


import com.exavalu.models.Employee;
import com.exavalu.utils.JDBCConnectionManager;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
//import java.util.logging.Level;
//import java.util.logging.Logger;
import org.apache.log4j.Logger;
import org.apache.log4j.Level;

/**
 *
 * @author Ayshik Palit
 */
public class EmployeeService {
    private static final Logger logger = Logger.getLogger(EmployeeService.class.getName());
    
    public static EmployeeService employeeService = null;
    
    public static EmployeeService getInstance()
    {
        if(employeeService==null)
        {
            return new EmployeeService();
        }
        else
        {
            return employeeService;
        }
    }
    
    public static ArrayList getAllEmployees() throws IOException, SQLException {

        ArrayList empList = new ArrayList();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "SELECT * FROM employees e join departments d join roles r where e.departmentId = d.departmentId and e.roleId = r.roleId and isDeleted=0 order by employeeId";
            PreparedStatement preparedStatement = con.prepareStatement(sql);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Employee emp = new Employee();
                emp.setAddress(rs.getString("address"));
                emp.setEmployeeId(rs.getString("employeeId"));
                emp.setFirstName(rs.getString("firstName"));
                emp.setLastName(rs.getString("lastName"));
                emp.setPhoneNo(rs.getString("phoneNo"));
                emp.setGender(rs.getString("gender"));
                emp.setAge(rs.getString("age"));
                emp.setDepartmentName(rs.getString("departmentName"));
                emp.setRoleName(rs.getString("roleName"));
                emp.setBasicSalary(rs.getString("basicSalary"));
                emp.setCarAllowance(rs.getString("carAllowance"));

                empList.add(emp);

            }

        } catch (SQLException ex) {
            logger.error("There is an error",ex);
        }
        System.out.println("Number of employees = " + empList.size());
        return empList;
    }
    
    public static boolean addEmployee(Employee emp) throws IOException, SQLException {
        boolean result = false;
        Connection con = JDBCConnectionManager.getConnection(); {

            String sql = "INSERT INTO employees ( firstName, lastName, phoneNo, address, gender, age, departmentId, roleId, basicSalary, carAllowance)VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, emp.getFirstName());
            preparedStatement.setString(2, emp.getLastName());
            preparedStatement.setString(3, emp.getPhoneNo());
            preparedStatement.setString(4, emp.getAddress());
            preparedStatement.setString(5, emp.getGender());
            preparedStatement.setString(6, emp.getAge());
            preparedStatement.setString(7, emp.getDepartmentId());
            preparedStatement.setString(8, emp.getRoleId());
            preparedStatement.setDouble(9, Double.parseDouble(emp.getBasicSalary()));
            preparedStatement.setDouble(10, Double.parseDouble(emp.getCarAllowance()));
            //preparedStatement.setDouble(11, emp.getSpecialAllowance());
            
            System.out.println(preparedStatement);
            int row = preparedStatement.executeUpdate();

            if (row == 1) {
                result = true;
            }
        return result;
        }
    }
    
    public static ArrayList searchEmployee(String firstName, String lastName, String gender, String departmentName, String roleName) throws SQLException {
        ArrayList empList = new ArrayList();

        Connection con = JDBCConnectionManager.getConnection(); {

            String sql = "SELECT * from employees e join departments d join roles r where e.departmentId = d.departmentId and e.roleId = r.roleId and isDeleted=0 and e.firstName like ? and e.lastName like ? and e.gender like ? and d.departmentName like ? and r.roleName like ?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, firstName + "%");
            preparedStatement.setString(2, lastName + "%");
            preparedStatement.setString(3, gender + "%");
            preparedStatement.setString(4, departmentName + "%");
            preparedStatement.setString(5, roleName + "%");

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Employee emp = new Employee();
                emp.setAddress(rs.getString("address"));
                emp.setEmployeeId(rs.getString("employeeId"));
                emp.setFirstName(rs.getString("firstName"));
                emp.setLastName(rs.getString("lastName"));
                emp.setPhoneNo(rs.getString("phoneNo"));
                emp.setGender(rs.getString("gender"));
                emp.setAge(rs.getString("age"));
                emp.setDepartmentName(rs.getString("departmentName"));
                emp.setRoleName(rs.getString("roleName"));
                emp.setBasicSalary(rs.getString("basicSalary"));
                emp.setCarAllowance(rs.getString("carAllowance"));
                //emp.setSpecialAllowance(rs.getDouble("specialAllowance"));

                empList.add(emp);
            }
        return empList;
        }
    }
    
     public static Employee getEmployee(String employeeId) throws IOException, SQLException{

        Employee emp = new Employee();
        Connection con = JDBCConnectionManager.getConnection(); {
            String sql = "SELECT * FROM employees e join departments d join roles r where e.departmentId = d.departmentId and e.roleId = r.roleId and isDeleted=0 and e.employeeId = ?";
            
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, employeeId);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                emp.setAddress(rs.getString("address"));
                emp.setEmployeeId(rs.getString("employeeId"));
                emp.setFirstName(rs.getString("firstName"));
                emp.setLastName(rs.getString("lastName"));
                emp.setPhoneNo(rs.getString("phoneNo"));
                emp.setGender(rs.getString("gender"));
                emp.setAge(rs.getString("age"));
                emp.setDepartmentName(rs.getString("departmentName"));
                emp.setRoleName(rs.getString("roleName"));
                emp.setBasicSalary(rs.getString("basicSalary"));
                emp.setCarAllowance(rs.getString("carAllowance"));

            }
        return emp;
        }
    }
    
    public static boolean updateEmployee(Employee emp, String employeeId) throws IOException, SQLException {

        boolean result = false;
        Connection con = JDBCConnectionManager.getConnection(); {
            String sql = "UPDATE employees SET firstName = ? , lastName = ? , phoneNo = ? , address = ?, gender = ? , age = ? , basicSalary = ?,carAllowance = ?, departmentId = ?, roleId =? WHERE employeeId = ?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            
            preparedStatement.setString(1, emp.getFirstName());
            preparedStatement.setString(2, emp.getLastName());
            preparedStatement.setString(3, emp.getPhoneNo());
            preparedStatement.setString(4, emp.getAddress());
            preparedStatement.setString(5, emp.getGender());
            preparedStatement.setString(6, emp.getAge());
            preparedStatement.setDouble(7, Double.parseDouble(emp.getBasicSalary()));
            preparedStatement.setDouble(8, Double.parseDouble(emp.getCarAllowance()));
            preparedStatement.setString(9, emp.getDepartmentId());
            preparedStatement.setString(10, emp.getRoleId());
            
            preparedStatement.setString(11, employeeId);
            int row = preparedStatement.executeUpdate();
            if(row==1)
            {
                result = true;
            }
        }
        return result;
    }
    
    public static boolean deleteEmployee(String employeeId) throws SQLException {
        boolean result = false;
        Connection con = JDBCConnectionManager.getConnection(); 

            String sql = "Update employees set isDeleted=1 WHERE employeeId = ?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, employeeId);

            int row = preparedStatement.executeUpdate();
            if (row == 1) {
                result = true;
            }
        return result;
    }
}
