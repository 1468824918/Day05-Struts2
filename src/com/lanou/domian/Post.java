package com.lanou.domian;

/**
 * Created by dllo on 17/10/16.
 */
public class Post {
    private int id;//职务id
    private String pname;//职务名称

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", pname='" + pname + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }
}
