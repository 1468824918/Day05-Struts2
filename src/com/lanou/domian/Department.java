package com.lanou.domian;

import java.util.List;

/**
 * Created by dllo on 17/10/16.
 */
public class Department {
    private int id;//部门id
    private String dname;//部门名称
    private List<Post> postList;//当前部门下的所有职务集合


    @Override
    public String toString() {
        return "Department{" +
                "id=" + id +
                ", dname='" + dname + '\'' +
                '}';
    }

    public List<Post> getPostList() {
        return postList;
    }

    public void setPostList(List<Post> postList) {
        this.postList = postList;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }
}
