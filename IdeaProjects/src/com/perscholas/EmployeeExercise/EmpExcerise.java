package com.perscholas.EmployeeExercise;

public class EmpExcerise {
    public static void main(String[] args) {

        Manager manager = new Manager(126534, "Peter", "Chennai India", 237844, 65000);
        System.out.println(manager.calcSalary());

        Trainee trainee = new Trainee(29846, "Jack", "Mumbai India", 442085, 45000);
        System.out.println(trainee.calcSalary());
    }
}
