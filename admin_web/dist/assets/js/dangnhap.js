
const container = document.getElementById('container');

function xacnhan(event) {
  // Lấy giá trị từ các trường nhập liệu
  const usernameValue = document.getElementById("username").value.trim();
  const passwordValue = document.getElementById("matkhau").value.trim();

  const username = document.getElementById("username");
  const password = document.getElementById("matkhau");

  let hasError = false;

  // Kiểm tra username (email)
  if (usernameValue === "") {
    username.style.border = "1px solid #ff8471"; // Đổi màu border nếu có lỗi
    loi("loi_username", "Username không được bỏ trống");
    hasError = true;
  } else {
    username.style.border = "1px solid #7b5be4"; // Đổi màu border nếu không có lỗi
    loi("loi_username", "");
  }

  // Kiểm tra password
  if (passwordValue === "") {
    password.style.border = "1px solid #ff8471";
    loi("loi_mat_khau", "Mật khẩu không được bỏ trống");
    hasError = true;
  } else if (passwordValue.length < 8) {
    password.style.border = "1px solid #ff8471";
    loi("loi_mat_khau", "Mật khẩu phải ít nhất 8 ký tự");
    hasError = true;
  } else {
    password.style.border = "1px solid #7b5be4";
    loi("loi_mat_khau", "");
  }

  if (hasError) {
    event.preventDefault(); // Ngăn chặn hành động mặc định của form nếu có lỗi
    alert("Vui lòng kiểm tra các lỗi trên và thử lại.");
  } else {
    return true; // Không có lỗi, cho phép gửi form
  }
}

function loi(id, message) {
  document.getElementById(id).innerHTML = message; // Hiển thị thông báo lỗi
}

async function dangnhap(event) {
  event.preventDefault(); // Ngăn hành động mặc định

  try {
    // Chờ phản hồi từ API
    const res = await fetch(`http://localhost:8081/api/v1/auth/signin`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        username: document.getElementById("username").value,
        password: document.getElementById("matkhau").value,
      }),
    });

    // Chờ lấy dữ liệu JSON từ phản hồi
    const data = await res.json();

    if (!res.ok) {
      // Nếu phản hồi không OK, hiển thị lỗi
      alert(`Đăng nhập không thành công: ${data.message || "Lỗi không xác định"}`);
      return;
    }

    const userRoles = data.listRoles; // Lấy danh sách vai trò
    console.log(userRoles);

    if (userRoles.includes("ROLE_USER") && userRoles.length === 1) {
      alert("Bạn không được phép truy cập.");
      return;
    }

    // Lưu token và chuyển hướng
    localStorage.setItem("token", data.token);
    console.log(localStorage.getItem("token"));
    window.location.href = "../../index.html"; // Chuyển hướng sau khi đăng nhập thành công
  } catch (error) {
    console.error("Lỗi khi đăng nhập:", error);
    alert("Có lỗi xảy ra. Vui lòng thử lại.");
  }
}