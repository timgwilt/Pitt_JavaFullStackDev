package com.perscholas.EmployeeExercise;

public abstract class User {

    private long employeeId;
    private String employeeName;
    private String employeeAddress;
    private long employeePhone;
    private double basicSalary;
    private double specialAllowance;
    private double hra;

    public User(long employeeId, String employeeName, String employeeAddress, long employeePhone) {
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.employeeAddress = employeeAddress;
        this.employeePhone = employeePhone;
    }

    public long getEmployeeId() {
        return employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public String getEmployeeAddress() {
        return employeeAddress;
    }

    public long getEmployeePhone() {
        return employeePhone;
    }

    public double getBasicSalary() {
        return basicSalary;
    }

    public double getSpecialAllowance() {
        return specialAllowance;
    }

    public double getHra() {
        return hra;
    }



}
