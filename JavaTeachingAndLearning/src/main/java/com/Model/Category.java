package com.Model;

import java.util.Date;

public class Category {
    private int categoryId;
    private String titlecg;
    private String desccg;
    private Date datecg;

    // Default constructor
    public Category() {}

    // Getters and Setters
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getTitlecg() {
        return titlecg;
    }

    public void setTitlecg(String titlecg) {
        this.titlecg = titlecg;
    }

    public String getDesccg() {
        return desccg;
    }

    public void setDesccg(String desccg) {
        this.desccg = desccg;
    }

    public Date getDatecg() {
        return datecg;
    }

    public void setDatecg(Date datecg) {
        this.datecg = datecg;
    }
}
