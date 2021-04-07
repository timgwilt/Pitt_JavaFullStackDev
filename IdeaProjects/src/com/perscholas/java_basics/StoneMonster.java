package com.perscholas.java_basics;

public class StoneMonster extends Creature {
    public StoneMonster(String name) {
        super(name);
    }

    @Override
    public String attack() {
        return "Attack with Stones!";
    }
}
