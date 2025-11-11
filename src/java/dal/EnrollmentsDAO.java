/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Timestamp;
import java.util.AbstractMap;
import java.util.LinkedHashMap;
import java.util.List;
import model.Enrollments;

/**
 *
 * @author Admin
 */
public class EnrollmentsDAO extends GenericDAO<Enrollments> {

    @Override
    public List<Enrollments> findAll() {
        return queryGenericDAO(Enrollments.class);
    }

    public static void main(String[] args) {
        // Tạo DAO
        EnrollmentsDAO enrollmentsDAO = new EnrollmentsDAO();

        // Dữ liệu giả lập để test
        int studentId = 154;  // Giả sử ID sinh viên hợp lệ
        int courseId = 1022;  // ID khóa học có trong database
        Timestamp enrolledDate = new Timestamp(System.currentTimeMillis());
        String status = "ENROLLED";  // Trạng thái đăng ký

        // Tạo đối tượng Enrollments
        Enrollments newEnrollment = Enrollments.builder()
                .student_id(studentId)
                .course_id(courseId)
                .enrolled_date(enrolledDate)
                .status(status)
                .build();

        try {
            // Thêm enrollment vào database
            enrollmentsDAO.insert(newEnrollment);
            System.out.println("✅ Enrollment added successfully!");

            // Hiển thị danh sách enrollment sau khi thêm
            List<Enrollments> enrollmentsList = enrollmentsDAO.findAll();
            System.out.println("📌 List of Enrollments:");
            for (Enrollments e : enrollmentsList) {
                System.out.println("Enrollment ID: " + e.getEnrollment_id()
                        + ", Student ID: " + e.getStudent_id()
                        + ", Course ID: " + e.getCourse_id()
                        + ", Date: " + e.getEnrolled_date()
                        + ", Status: " + e.getStatus());
            }

        } catch (RuntimeException e) {
            System.err.println("❌ ERROR: " + e.getMessage());
        }
    }

    public void add(Enrollments newEnrollment) {
        String sql = "INSERT INTO enrollments (student_id, course_id, enrolled_date, status) VALUES (?, ?, ?, ?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("student_id", newEnrollment.getStudent_id());
        parameterMap.put("course_id", newEnrollment.getCourse_id());
        parameterMap.put("enrolled_date", newEnrollment.getEnrolled_date());
        parameterMap.put("status", newEnrollment.getStatus());
        insertGenericDAO(sql, parameterMap);
    }

    public void update(Enrollments updatedEnrollment) {
        String sql = "UPDATE enrollments SET student_id = ?, course_id = ?, enrolled_date = ?, status = ? WHERE enrollment_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("student_id", updatedEnrollment.getStudent_id());
        parameterMap.put("course_id", updatedEnrollment.getCourse_id());
        parameterMap.put("enrolled_date", updatedEnrollment.getEnrolled_date());
        parameterMap.put("status", updatedEnrollment.getStatus());
        parameterMap.put("enrollment_id", updatedEnrollment.getEnrollment_id());
        updateGenericDAO(sql, parameterMap);
    }

    public boolean delete(int enrollmentId) {
        String sql = "UPDATE Enrollments\n"
                + "SET status = 'CANCELLED'\n"
                + "WHERE enrollment_id = ?";
        parameterMap = parameterMap = new LinkedHashMap<>();
        parameterMap.put("enrollment_id", enrollmentId);
        return updateGenericDAO(sql, parameterMap);
    }

    public Enrollments findById(int enrollmentId) {
        String sql = "SELECT * FROM enrollments WHERE enrollment_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("enrollment_id", enrollmentId);
        List<Enrollments> list = queryGenericDAO(Enrollments.class, sql, parameterMap);
        return list.get(0);
    }

    public void insert(Enrollments enrollments) {
        String insertSql = "INSERT INTO enrollments (student_id, course_id, enrolled_date, status) VALUES (?, ?, ?, ?);";
        String updateSql = "UPDATE courses "
                + "SET max_students = max_students - 1 "
                + "WHERE course_id = ? AND max_students > 0;";
        try {
            parameterMap = new LinkedHashMap<>();
            parameterMap.put("student_id", enrollments.getStudent_id());
            parameterMap.put("course_id", enrollments.getCourse_id());
            parameterMap.put("enrolled_date", enrollments.getEnrolled_date());
            parameterMap.put("status", enrollments.getStatus());
            int insertResult = insertGenericDAO(insertSql, parameterMap);
            if (insertResult == 0) {
                throw new RuntimeException("❌ Enrollment failed: Could not insert into enrollments.");
            }
            parameterMap.clear();
            parameterMap.put("course_id", enrollments.getCourse_id());
            boolean update = updateGenericDAO(updateSql, parameterMap);
            if (!update) {
                throw new RuntimeException("❌ Enrollment failed: The course is full.");
            }

        } catch (Exception e) {
        }
    }

    public List<Enrollments> findByStudentID(int studentID) {
        String sql = "SELECT e.enrollment_id, e.student_id, u.full_name, e.course_id, c.title, e.enrolled_date, e.status "
                + "FROM enrollments e "
                + "JOIN users u ON e.student_id = u.user_id "
                + "JOIN courses c ON e.course_id = c.course_id "
                + "WHERE e.student_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("student_id", studentID);
        return queryGenericDAO(Enrollments.class, sql, parameterMap);
    }

}
