package com.perscholas.java_basics;

public class Creature extends Monster {

    private String name;

    public Creature(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String attack() {
        return "I don't know how to attack!";
    }
}
