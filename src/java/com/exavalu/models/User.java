/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.services.DepartmentService;
import com.exavalu.services.EmployeeService;
import com.exavalu.services.LoginService;
import com.exavalu.services.RoleService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Map;
import org.apache.log4j.Logger;
import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;


public class User extends ActionSupport implements ApplicationAware, SessionAware, Serializable {


    private String firstName;
    private String lastName;
    private String emailAddress;
    private String password;
    private String countryCode,stateCode,distCode;

    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

    private ApplicationMap map = (ApplicationMap) ActionContext.getContext().getApplication();

    @Override
    public void setApplication(Map<String, Object> application) {
        setMap((ApplicationMap) application);
    }

    @Override
    public void setSession(Map<String, Object> session) {
        setSessionMap((SessionMap<String, Object>) (SessionMap) session);
    }

    public String doLogin() throws Exception {
        String result = "FAILURE";

        boolean success = LoginService.getInstance().doLogin(this);
        ArrayList empList = EmployeeService.getAllEmployees();
        ArrayList deptList = DepartmentService.getAllDepartment();
        ArrayList roleList = RoleService.getAllRoles();
        
        if (success) {
            getSessionMap().put("User",this);
            getSessionMap().put("EmpList", empList);
            getSessionMap().put("DeptList", deptList);
            getSessionMap().put("RoleList", roleList);
            System.out.println("returning Success from doLogin method");
            result = "SUCCESS";
        } else {
            Logger logger = Logger.getLogger(User.class.getName());
            logger.error("Either Email Id or Password is incorrect");
            System.out.println("returning Failure from doLogin method");
        }

        return result;
    }
    
    public String doPreSignUp() throws Exception {
        String result = "FAILURE";
        
        ArrayList countryList = LoginService.getAllCountries();
        ArrayList stateList = null;
        ArrayList distList = null;
        
        sessionMap.put("CountryList", countryList);
        
        System.err.println("Country Code="+this.countryCode);
        System.err.print("State Code="+this.stateCode); 
        
//        if(this.countryCode!=null && this.stateCode!=null)
//        {
//            distList = LoginService.getAllDistricts(this.stateCode);
//            sessionMap.put("DistList", distList);
//            sessionMap.put("User", this);
//        }
        
        if(this.countryCode!=null)
        {
            stateList = LoginService.getAllStates(this.countryCode);
            sessionMap.put("StateList", stateList);
            sessionMap.put("User", this);
            result = "STATELIST";
        }
        if (this.stateCode != null) {
            System.out.println("State Code:" + this.getStateCode());
            distList = LoginService.getAllDistricts(this.stateCode);
            sessionMap.put("DistList", distList);
            sessionMap.put("User", this);
            result = "DISTLIST";
        }
        
        if (this.firstName != null && this.firstName.length()>0 && this.lastName != null && this.lastName.length()>0 && this.emailAddress != null && this.emailAddress.length()>0 && this.password!= null && this.password.length()>0 && this.stateCode != null && this.stateCode.length() > 0 && this.countryCode != null && this.countryCode.length() > 0 && this.distCode != null && this.distCode.length() > 0) {
            System.out.println(firstName + lastName +  emailAddress + password+ this.getStateCode()+ this.getCountryCode()+ this.getDistCode());
            boolean res = LoginService.sendData(this);
            if (res) {
                result = "SUCCESS";
            } else {
                String alreadyExist = "Email Id Already Exist";
                sessionMap.put("AlreadyExist", alreadyExist);
            }
        }   
        return result;
    }
    
    public String doLogout() {
        String result = "SUCCESS";
        getSessionMap().invalidate();
        return result;
    }
    
    public String addUser() throws IOException {
        String result = "FAILURE";
        
            this.setFirstName(getFirstName());
            this.setLastName(getLastName());
            this.setEmailAddress(getEmailAddress());
            this.setPassword(getPassword());
            
            this.setCountryCode(getCountryCode());
            this.setStateCode(getStateCode());
            this.setDistCode(getDistCode());
            
            boolean res = LoginService.sendData(this);
            if (res){
                getSessionMap().put("User",this);
                System.out.println("returning Success from addUser method");
                result = "SUCCESS";
            }
            else{
                String alreadyExist = "Email Id Already Exist";
                getSessionMap().put("AlreadyExist", alreadyExist);
            }
        return result;
    }

    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the sessionMap
     */
    public SessionMap<String, Object> getSessionMap() {
        return sessionMap;
    }

    /**
     * @param sessionMap the sessionMap to set
     */
    public void setSessionMap(SessionMap<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
    }

    /**
     * @return the map
     */
    public ApplicationMap getMap() {
        return map;
    }

    /**
     * @param map the map to set
     */
    public void setMap(ApplicationMap map) {
        this.map = map;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public String getStateCode() {
        return stateCode;
    }

    public void setStateCode(String stateCode) {
        this.stateCode = stateCode;
    }

    public String getDistCode() {
        return distCode;
    }

    public void setDistCode(String distCode) {
        this.distCode = distCode;
    }
}
