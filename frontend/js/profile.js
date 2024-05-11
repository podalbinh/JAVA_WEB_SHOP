async function fetchUser() {
  const users = await fetch(`${api}/api/users/me`, {
    headers: { 
        "Content-Type": "application/json",
      Accept: "application/json",
      Authorization: "Bearer " + localStorage.getItem("token")
    },
  });
  const user = await users.json();
  return user;
}

async function updateUserService(username, email, phone, password) {
    const response = await fetch(`${api}/api/v1/auth`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json",
            Accept: "application/json",
            Authorization: "Bearer " + localStorage.getItem("token")
        },
        body: JSON.stringify({
            username: username,
            email: email,
            phone: phone,
            password: password
        }),
    });
    const updatedUser = response.json();
    return updatedUser;
}

async function getAllOrders() {
    const response = await fetch(`${api}/api/v1/orders`, {
        method: "GET",
        headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + localStorage.getItem("token"),
        },
    });

    if (!response.ok) {
        throw new Error("Failed to fetch orders");
    }

    const orders = await response.json();
    return orders;
}

  
let currentEditUserId = null;

// Cập nhật để hiển thị mật khẩu dưới dạng dấu sao
async function loadUser() {
    const user = await fetchUser();
    console.log(user);
    const profile_user = document.getElementById('profile_user');
    profile_user.innerHTML = "";
    const ul = document.createElement("ul");
    ul.setAttribute("data-user-id", user.id);
    ul.className = "profile__wrapper";

    ul.innerHTML = `
        <li class="profile__item wrap__profile__avt">
            <button id ="btn_edit_user" class="btn btn-info btn-sm" style="margin-top: 10px;" onclick="editUser(event)">Cập nhật thông tin</button>
        </li>

        <!-- User information items -->
        <li class="profile__item" style="margin-top: 20px">
            <p><strong>Tài khoản: </strong><span id="profile__username_2">${user.username}</span></p>
        </li>
        <li class="profile__item">
            <p><strong>Mật khẩu: </strong><span id="profile__password">********</span></p> <!-- Hiển thị dưới dạng dấu sao -->
        </li>
        <li class="profile__item">
            <p><strong>Email: </strong><span id="profile__email">${user.email}</span></p>
        </li>
        <li class="profile__item">
            <p><strong>Phone: </strong><span id="profile__phone">${user.phone}</span></p>
        </li>
        <li class="profile__item">
            <p><strong>Ngày tạo tài khoản: </strong><span id="profile__createdDate">${user.created}</span></p>
        </li>
    `;
    profile_user.appendChild(ul);
}

loadUser();

function editUser(event) {
    const ul = event.target.closest("ul"); 
    currentEditUserId = ul.getAttribute("data-user-id");
    // Hiển thị modal
    $("#editUserModal").modal("show"); // Yêu cầu Bootstrap để hiển thị modal

    // Lấy thông tin hiện tại và điền vào các trường trong modal
    const username = document.getElementById("profile__username_2").textContent;
    const email = document.getElementById("profile__email").textContent;
    const phone = document.getElementById("profile__phone").textContent;

    document.getElementById("editUsername").value = username;
    document.getElementById("editEmail").value = email;
    document.getElementById("editPhone").value = phone;
}

// Lưu thay đổi thông tin người dùng khi nút "Lưu" được nhấn trong modal chỉnh sửa
const saveUser = document.getElementById("saveUserChanges");

saveUser.addEventListener("click", async () => {
    // Lấy thông tin mới từ các trường nhập liệu trong modal
    const username = document.getElementById("editUsername").value;
    const email = document.getElementById("editEmail").value;
    const phone = document.getElementById("editPhone").value;
    const password = document.getElementById("editPassword").value;
    console.log(username, email, phone, password);
    console.log(currentEditUserId)
    if(currentEditUserId) {
        // Gửi yêu cầu PUT HTTP để cập nhật thông tin người dùng
        await fetch(`${api}/api/v1/auth`, {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
                Accept: "application/json",
                Authorization: "Bearer " + localStorage.getItem("token")
            },
            body: JSON.stringify({
                username: username,
                email: email,
                phone: phone,
                password: password
            }),
        }).then((res) => {
            localStorage.removeItem("token");
            window.location.href="./signIn.html";
        });
        
        // Đóng modal chỉnh sửa sau khi lưu thành công
        $("#editUserModal").modal("hide");
    } 
});

async function loadOrdersToTable() {
    const orders = await getAllOrders(); // Lấy danh sách đơn hàng
    const tableBody = document.getElementById("orderTableBody")

    tableBody.innerHTML = ""; 

    for (const [index, order] of orders.entries()) {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td>${index + 1}</td> 
            <td>${formatDateTime(order.createdAt)}</td> 
            <td>${numberToVnd(order.total)}</td>
            <td>${order.status.name}</td>  
            <td>
                <button class="btn btn-info btn-view-details" data-order-id="${order.id}">Xem chi tiết</button> <!-- Nút xem chi tiết -->
            </td>
        `;

        tableBody.appendChild(row);
    }
    // Sự kiện cho nút xem chi tiết
    document.querySelectorAll(".btn-view-details").forEach((button) => {
        button.addEventListener("click", async function () {
            const orderId = this.getAttribute("data-order-id");
            await loadOrderDetails(orderId); // Hiển thị thông tin chi tiết
        });
    });
}

// Hàm để tải chi tiết OrderItem vào modal
async function loadOrderDetails(orderId) {
    const response = await fetch(`${api}/api/v1/orders/${orderId}`);
    const order = await response.json();

    const modalBody = document.querySelector("#orderDetailsModal .modal-body table tbody");
    modalBody.innerHTML = ""; // Xóa nội dung cũ
    
    order.orderItems.forEach((item, index) => {
        const itemRow = `
            <tr>
                <td>${index + 1}</td>
                <td>${item.name}</td>
                <td>${item.quantity}</td>
                <td>${numberToVnd(item.price * item.quantity)}</td> <!-- Tổng giá trị của OrderItem -->
            </tr>
        `;
        modalBody.innerHTML += itemRow;
    });

    // Hiển thị modal
    $("#orderDetailsModal").modal('show');
}

const closeButton = document.getElementById("btn_close_modal");
console.log(closeButton.innerHTML);
closeButton.addEventListener("click", () => {
    // Lấy phần tử modal
    $("#orderDetailsModal").modal('hide');
})

function formatDateTime(dateTimeString) {
    // Tạo một đối tượng Date từ chuỗi đầu vào
    var dateTime = new Date(dateTimeString);

    // Lấy ngày, tháng và năm từ đối tượng Date
    var day = dateTime.getDate();
    var month = dateTime.getMonth() + 1; // Tháng bắt đầu từ 0 nên cần cộng thêm 1
    var year = dateTime.getFullYear();

    var formattedDate = year + '/' + month + '/' + day;

    return formattedDate;
}

function numberToVnd(number) {
    var formatter = new Intl.NumberFormat("vn-VN", {
      style: "currency",
      currency: "VND",
    });
    return formatter.format(number);
  }

// Gọi hàm để tải dữ liệu vào bảng khi trang được tải
document.addEventListener("DOMContentLoaded", loadOrdersToTable);