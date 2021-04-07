package com.perscholas.EmployeeExercise;

public class Manager extends Employee{

    public Manager(long employeeId, String employeeName, String employeeAddress, long employeePhone, double basicSalary) {
        super(employeeId, employeeName, employeeAddress, employeePhone);
        super.setBasicSalary(basicSalary);
        //super.setSpecialAllowance(super.getBasicSalary() * .15);

    }

    @Override
    public double calcSalary() {
        return super.calcSalary();
    }
}
