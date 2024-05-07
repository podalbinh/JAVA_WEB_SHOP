// Lấy danh sách người dùng
async function getUsersService() {
    const response = await fetch(`${api}/api/users`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: "Bearer " + localStorage.getItem("token"),
      },
    });
  
    if (!response.ok) {
      throw new Error("Failed to fetch users");
    }
  
    const users = await response.json();
    return users;
}

// Lấy người dùng qua ID
async function getUserByIdService(userId) {
  const response = await fetch(`${api}/api/users/${userId}`, {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
      Accept: "application/json",
      Authorization: "Bearer " + localStorage.getItem("token"),
    },
  });

  if (!response.ok) {
    throw new Error("Failed to fetch user by ID");
  }

  const user = await response.json();
  return user;
}

// Tìm kiếm người dùng bằng username
async function getUserByUserName(query) {
  const response = await fetch(`${api}/api/users/search?query=${query}`, {
    method: 'GET',
    headers: {
      "Content-Type": "application/json",
      Authorization: 'Bearer ' + localStorage.getItem("token"),
    },
  });
  const user = response.json();
  return user;
}

// Thêm người dùng mới
async function addUserService(user) {
    const response = await fetch(`${api}/api/users`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: "Bearer " + localStorage.getItem("token"),
      },
      body: JSON.stringify(user),
    });
  
    if (!response.ok) {
      throw new Error("Failed to add user");
    }
  
    const newUser = await response.json();
    return newUser;
}

// Xóa người dùng
async function deleteUserService(userId) {
    const response = await fetch(`${api}/api/users/${userId}`, {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: "Bearer " + localStorage.getItem("token"),
      },
    });

    return response;
}
//Cập nhật thông tin người dùng
async function updateCartItemService(userId, username, email, phone) {
  const users = await fetch(`${api}/api/users/${userId}`, {
    method: "PUT",
    headers: { 
      "Content-Type": "application/json",
      Accept: "application/json",
      Authorization: "Bearer " + localStorage.getItem("token")
    },
    body: JSON.stringify({
      username: username,
      email: email,
      phone: phone
    }),
  }).then((res) => res.json());
  return users;
}

let currentEditUserId = null;

async function loadUsers() {
    const users = await getUsersService();
    const userListElement = document.getElementById("user-list");
    userListElement.innerHTML = ""; // Xóa nội dung hiện có
  
    users.forEach((user) => {
      const row = document.createElement("tr");
      row.setAttribute("data-user-id", user.id);

      row.innerHTML = `
        <td>${user.username}</td>
        <td>${user.email}</td>
        <td>${user.phone || "-"}</td>
        <td>${new Date(user.created).toLocaleDateString("en-GB")}</td>
        <td>${user.userStatus ? "Active" : "Inactive"}</td>
        <td>
          <button class="btn btn-danger btn-sm btn_delete_user">Delete</button>
          <button class="btn btn-info btn-sm btn_edit_user" style="margin-left: 10px;">Edit</button>
        </td>
      `;
      userListElement.appendChild(row);
    });
    setupEditAndDelete()
}  

async function deleteUser(id) {
  await deleteUserService(id);
  await loadUsers();
}

loadUsers();

// Tham chiếu tới các phần tử trong modal
const confirmAddUserButton = document.getElementById("confirmAddUser");
const cancelAddUserButton = document.querySelector("#addUserModal .btn-secondary");
const addUserModalTitle = document.getElementById("addUserModalLabel");
  
// Sự kiện nhấn nút Confirm trong modal
confirmAddUserButton.addEventListener("click", async () => {
  const username = document.getElementById("username").value;
  const email = document.getElementById("email").value;
  const password = document.getElementById("password").value;
  const phone = document.getElementById("phone").value;

  console.log(currentEditUserId);
  if (currentEditUserId) { // Nếu đang chỉnh sửa
    await updateUserService(currentEditUserId, username, email, phone);
    currentEditUserId = null; // Đặt lại sau khi chỉnh sửa
    addUserModalTitle.textContent = "Add New User"; // Đặt lại tiêu đề
    // Hiển thị lại các trường và nhãn
    document.querySelector("label[for='password']").style.display = "block";
    document.getElementById("password").style.display = "block";
  } else { // Nếu là thêm mới
    const newUser = { username, email, password, phone };
    await addUserService(newUser);
  }

  // Đóng modal và đặt lại các trường
  $("#addUserModal").modal("hide");
  document.getElementById("addUserForm").reset(); // Đặt lại form
  await loadUsers(); // Cập nhật lại bảng
});

// Sự kiện nhấn nút Cancel
cancelAddUserButton.addEventListener("click", () => {
    $("#addUserModal").modal("hide"); // Đóng modal
    document.getElementById("addUserForm").reset(); // Đặt lại các trường
    currentEditUserId = null;

    // Hiển thị lại nhãn và trường
    document.querySelector("label[for='password']").style.display = "block";
    document.getElementById("password").style.display = "block";
    addUserModalTitle.textContent = "Add New User"; 
});

//Search User
async function searchUser() {
  const query = document.getElementById("search-input").value.trim().toLowerCase();
  console.log(query) // Lấy từ khóa tìm kiếm
  const userListElement = document.getElementById("user-list");

  if (query === "") { // Nếu ô tìm kiếm trống, tải lại danh sách đầy đủ
    await loadUsers(); // Hàm tải danh sách người dùng
    return;
  }

  const filteredUsers = await getUserByUserName(query);
  userListElement.innerHTML = ""; // Xóa danh sách cũ

  // Cập nhật danh sách người dùng sau tìm kiếm
  filteredUsers.forEach((user) => {
    const row = document.createElement("tr");
    row.setAttribute("data-user-id", user.id);

    row.innerHTML = `
      <td>${user.username}</td>
      <td>${user.email}</td>
      <td>${user.phone || "-"}</td>
      <td>${new Date(user.created).toLocaleDateString("en-GB")}</td>
      <td>${user.userStatus ? "Active" : "Inactive"}</td>
      <td>
        <button class="btn btn-danger btn-sm btn_delete_user">Delete</button>
        <button class="btn btn-info btn-sm btn_edit_user" style="margin-left: 10px;">Edit</button>
      </td>
    `;

    userListElement.appendChild(row);
  });
  setupEditAndDelete();
}
// Gán sự kiện cho ô tìm kiếm
document.getElementById("search-input").addEventListener("input", searchUser); // Sử dụng sự kiện input để cập nhật theo thời gian thực

function setupEditAndDelete() {
  const deleteButtons = document.querySelectorAll(".btn_delete_user")
  console.log(deleteButtons);
  deleteButtons.forEach((button) => {
    button.addEventListener("click", async (e) => {
      const row = e.target.closest("tr"); // Tìm hàng chứa nút
      currentEditUserId = row.getAttribute("data-user-id"); // Lấy ID
      const confirmDelete = confirm("Bạn có chắc chắn muốn xóa người dùng này?");
      if (confirmDelete) {
        await deleteUser(currentEditUserId);
      }
    })
  });

  // Sử dụng `document.querySelectorAll` để lấy tất cả nút "Edit"
  const editButtons = document.querySelectorAll(".btn_edit_user");
  console.log(editButtons);
  // Gắn sự kiện cho mỗi nút "Edit"
  editButtons.forEach((editButton) => {
    editButton.addEventListener("click", async (event) => {
      const row = event.target.closest("tr"); // Tìm hàng chứa nút
      currentEditUserId = row.getAttribute("data-user-id"); // Lấy ID
      // console.log("Edit User ID:", currentEditUserId);

      // Đặt lại tiêu đề modal
      addUserModalTitle.textContent = "Edit User";

      // Lấy các trường cần điền
      const usernameInput = document.getElementById("username");
      const emailInput = document.getElementById("email");
      const phoneInput = document.getElementById("phone");

      // Lấy dữ liệu người dùng từ API theo ID
      const userToEdit = await getUserByIdService(currentEditUserId);
      // console.log("User to Edit:", userToEdit);

      if (userToEdit) {
        // Ẩn nhãn và trường
        document.querySelector("label[for='password']").style.display = "none";
        document.getElementById("password").style.display = "none";
        usernameInput.value = userToEdit.username; // Điền thông tin
        emailInput.value = userToEdit.email;
        phoneInput.value = userToEdit.phone;
        // Hiển thị modal
        $("#addUserModal").modal("show");
      }
    });
  });
}
