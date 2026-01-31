package com.example.student_management;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;

@Repository
public interface AttendanceRepository extends JpaRepository<Attendance, Long> {
    
   
    boolean existsByStudentIdAndDate(Long studentId, LocalDate date);
    
    
    long countByStudentId(Long studentId);
}