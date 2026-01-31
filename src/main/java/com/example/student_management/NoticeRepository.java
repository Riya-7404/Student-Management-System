package com.example.student_management;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface NoticeRepository extends JpaRepository<Notice, Long> {
    
    List<Notice> findByStudentId(Long studentId);

    List<Notice> findByStudentIdOrStudentIdOrderByCreatedAtDesc(Long studentId, Long globalId);
}