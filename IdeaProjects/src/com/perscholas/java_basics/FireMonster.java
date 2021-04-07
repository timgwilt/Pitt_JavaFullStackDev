package com.perscholas.java_basics;

public class FireMonster extends Creature {
    public FireMonster(String name) {
        super(name);
    }

    @Override
    public String attack() {
        return "Attack with Fire!";
    }
}
