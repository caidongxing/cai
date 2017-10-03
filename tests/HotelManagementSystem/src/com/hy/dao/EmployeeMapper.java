package com.hy.dao;

import com.hy.po.Employee;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Integer employeeid);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Integer employeeid);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
}