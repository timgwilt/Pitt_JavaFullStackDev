package com.perscholas.EmployeeExercise;

public class Trainee extends Employee{

    public Trainee(long employeeId, String employeeName, String employeeAddress, long employeePhone, double basicSalary) {
        super(employeeId, employeeName, employeeAddress, employeePhone);
        super.setBasicSalary(basicSalary);
        //super.setSpecialAllowance(super.getBasicSalary() * .1);

    }

    @Override
    public double calcSalary() {
        return super.calcSalary();
    }
}
