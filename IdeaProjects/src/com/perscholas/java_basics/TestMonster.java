package com.perscholas.java_basics;


public class TestMonster {
    public static void main(String[] args) {
        Creature m1 = new FireMonster("r2u2");
        Creature m2 = new WaterMonster("u2r2");
        Creature m3 = new StoneMonster("r2r2");

        System.out.println(m1.attack());
        System.out.println(m2.attack());
        System.out.println(m3.attack());

        m1 = new StoneMonster("a2b2");
        System.out.println(m1.attack());

        Creature m4 = new Creature("u2u2");
        System.out.println(m4.attack());
    }
}
