package com.softwerke.tms.repository;

public class ReportData {
    String name;
    int value;

    public ReportData(String name, int value) {
        this.name = name;
        this.value = value;
    }

    public ReportData() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }
}
