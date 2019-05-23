package com.example.ssm_springbootx.dao;

import com.example.ssm_springbootx.model.Attendance;

import java.util.List;

public interface AttendanceDao {
    boolean addAttendance(Attendance attendance);
    boolean deleteAttendance(Attendance attendance);
    boolean updateAttendance(Attendance attendance);
    Attendance getAttendance(Attendance attendance);
    List<Attendance> getAttendances(Attendance attendance);
}
