package com.perscholas.java_basics;

public class WaterMonster extends Creature {
    public WaterMonster(String name) {
        super(name);
    }

    @Override
    public String attack() {
        return "Attack with Water!";
    }
}
