// Hàm để xử lý khi nhấn nút "Signout"
function signOut() {
    // Xóa token từ localStorage
    localStorage.removeItem("token");
  }
  
  // Gán hàm signOut vào sự kiện click của nút "Signout"
  document.addEventListener("DOMContentLoaded", function() {
    const signOutButton = document.querySelector(".btn-sign-out"); // Chọn nút "Signout" bằng cách dùng một selector phù hợp
    if (signOutButton) {
      signOutButton.addEventListener("click", signOut); // Gắn sự kiện click vào nút "Signout"
    }
});

// Hàm lấy thông tin người dùng hiện tại
async function getCurrentUser() {
    // Lấy token từ localStorage
    const token = localStorage.getItem("token");

    if (!token) {
      console.error("Token không tồn tại.");
      return null;
    }
  
    try {
      const response = await fetch("http://localhost:8081/api/users/me", {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token, // Gắn token vào header
        },
      });
  
      if (!response.ok) {
        throw new Error("Không thể lấy thông tin người dùng.");
      }
  
      const user = await response.json();
      return user;
    } catch (error) {
      console.error("Lỗi khi lấy thông tin người dùng:", error);
      return null;
    }
  }
  
  // Hàm cập nhật tên người dùng trên giao diện
  async function updateUserName() {
    const user = await getCurrentUser(); // Lấy thông tin người dùng
    if (user) {
      const userNameElement = document.querySelector(".user_name"); // Phần tử HTML cần cập nhật
      if (userNameElement) {
        userNameElement.textContent = user.username; // Cập nhật tên người dùng
      }
    }
  }

  // Gọi hàm cập nhật khi trang được tải
document.addEventListener("DOMContentLoaded", updateUserName);