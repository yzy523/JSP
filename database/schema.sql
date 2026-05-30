-- 学生管理系统数据库脚本
-- Database Script for Student Management System

-- 创建数据库
CREATE DATABASE IF NOT EXISTS student_system;
USE student_system;

-- 用户表
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 学生表
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id VARCHAR(20) NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F', 'Other') DEFAULT 'Other',
    phone VARCHAR(20),
    email VARCHAR(100),
    class_name VARCHAR(50),
    enrollment_date DATE,
    status ENUM('active', 'graduated', 'dropped') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT,
    FOREIGN KEY (created_by) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 考勤表
CREATE TABLE attendance (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    check_in_time TIMESTAMP NULL,
    check_out_time TIMESTAMP NULL,
    date DATE NOT NULL,
    status ENUM('present', 'absent', 'late', 'early_leave') DEFAULT 'present',
    remarks VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    UNIQUE KEY unique_attendance (student_id, date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 创建索引以提高查询性能
CREATE INDEX idx_username ON users(username);
CREATE INDEX idx_student_id ON students(student_id);
CREATE INDEX idx_class_name ON students(class_name);
CREATE INDEX idx_attendance_date ON attendance(date);
CREATE INDEX idx_attendance_student ON attendance(student_id);

-- 插入示例数据
INSERT INTO users (username, password, email) VALUES 
('admin', 'WcYy8lFxT/cHSLFmrpvZOA==', 'admin@school.com'),
('teacher', 'WcYy8lFxT/cHSLFmrpvZOA==', 'teacher@school.com');

INSERT INTO students (student_id, name, gender, phone, email, class_name, enrollment_date, status, created_by) VALUES 
('STU001', '张三', 'M', '13800001111', 'zhangsan@school.com', '高一A班', '2023-09-01', 'active', 1),
('STU002', '李四', 'F', '13800001112', 'lisi@school.com', '高一A班', '2023-09-01', 'active', 1),
('STU003', '王五', 'M', '13800001113', 'wangwu@school.com', '高一B班', '2023-09-01', 'active', 1);

INSERT INTO attendance (student_id, check_in_time, check_out_time, date, status) VALUES 
(1, '2026-05-30 08:00:00', '2026-05-30 17:00:00', '2026-05-30', 'present'),
(2, '2026-05-30 08:15:00', '2026-05-30 17:00:00', '2026-05-30', 'late'),
(3, NULL, NULL, '2026-05-30', 'absent');
