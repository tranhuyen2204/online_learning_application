package controller.authen;

import dal.UsersDao;
import model.Users;
import org.junit.Test;

public class AuthenticationControllerTest {

    @Test
    public void testLoginWithRealDatabase() {
        String email = "nguyenthilan@example.com";
        String password = "password123";

        UsersDao dao = new UsersDao();
        Users user = Users.builder().email(email).password(password).build();

        Users found = dao.findByUserNameAndPass(user);

        if (found == null) {
            throw new AssertionError("❌ Không tìm thấy người dùng trong CSDL!");
        } else {
            System.out.println("✅ Đăng nhập thành công với DB thật: " + found.getEmail());
        }
    }
}
