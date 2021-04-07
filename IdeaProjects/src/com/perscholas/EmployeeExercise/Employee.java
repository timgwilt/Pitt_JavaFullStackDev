package com.perscholas.EmployeeExercise;

public class Employee extends User {
    private double basicSalary;
    private double specialAllowance;
    private double hra;

    public Employee(long employeeId, String employeeName, String employeeAddress, long employeePhone) {
        super(employeeId, employeeName, employeeAddress, employeePhone);
        this.specialAllowance = 250.80;
        this.hra = 1000.50;
    }

    public double getBasicSalary() {
        return basicSalary;
    }

    public void setBasicSalary(double basicSalary) {
        this.basicSalary = basicSalary;
    }

    public double getSpecialAllowance() {
        return specialAllowance;
    }

    public void setSpecialAllowance(double specialAllowance) {
        this.specialAllowance = specialAllowance;
    }

    public double getHra() {
        return hra;
    }

    public double calcSalary() {
        return this.basicSalary + (this.basicSalary * this.specialAllowance/100) +(this.basicSalary * this.hra/100);
    }
}
