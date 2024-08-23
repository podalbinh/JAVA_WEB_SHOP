// Lấy tất cả đơn hàng từ API
async function getAllOrders() {
    const response = await fetch(`${api}/api/v1/orders/admin`, {
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

async function loadOrdersToTable() {
    const orders = await getAllOrders(); // Lấy danh sách đơn hàng
    const tableBody = document.querySelector("table.table-striped tbody");

    tableBody.innerHTML = ""; 

    for (const [index, order] of orders.entries()) {
        const row = document.createElement("tr");
        const dateObj = new Date(order.createdAt);

    // Function to add leading zero to day, month, hours, minutes, and seconds if needed
    const addLeadingZero = (number) => (number < 10 ? `0${number}` : number);

    // Extract the components of the date
    const day = addLeadingZero(dateObj.getDate());
    const month = addLeadingZero(dateObj.getMonth() + 1); // Months are zero-based in JavaScript
    const year = dateObj.getFullYear();
    const hours = addLeadingZero(dateObj.getHours());
    const minutes = addLeadingZero(dateObj.getMinutes());
    const seconds = addLeadingZero(dateObj.getSeconds());

    // Format the date in 'dd-mm-yyyy hh:mm:ss'
    const date = `${day}-${month}-${year} ${hours}:${minutes}:${seconds}`;
        // Tạo dropdown cho trạng thái và nút cập nhật
        const statusOptions = await generateStatusOptions(order.status.id);
        
        row.innerHTML = `
            <td>${index + 1}</td> 
            <td>${order.firstName} ${order.lastName}</td> 
            <td>${order.phone}</td>  
            <td >${order.address}</td>  
            <td>${numberToVnd(order.total)}</td>  
            <td>${date}</td>  
            <td class="p-0" >
                <select class="statuss status-dropdown" data-order-id="${order.id}">
                    ${statusOptions} <!-- Các tùy chọn trạng thái -->
                </select>
            </td>
            <td>
                <button class="btn btn-primary btn-update-status" data-order-id="${order.id}">Cập nhật</button> <!-- Nút cập nhật -->
                <button class="btn btn-info btn-view-details" data-order-id="${order.id}">Xem chi tiết</button> <!-- Nút xem chi tiết -->
            </td>
        `;

        tableBody.appendChild(row);
    }

    // Sự kiện cho nút cập nhật trạng thái
    document.querySelectorAll(".btn-update-status").forEach(async (button) => {
        button.addEventListener("click", async function () {
            const orderId = this.getAttribute("data-order-id");
    
            // Lấy dữ liệu từ hàng tương ứng
            const row = this.closest("tr");
    
            const firstName = row.children[1].textContent.split(" ")[0];
            const lastName = row.children[1].textContent.split(" ")[1];
            const phone = row.children[2].textContent;
            console.log(phone);
            const address = row.children[3].textContent;
            const total = parseFloat(row.children[4].textContent); // Chuyển đổi thành số
            const statusDropdown = document.querySelector(`select[data-order-id="${orderId}"]`);
            const newStatusId = statusDropdown.value;
    
            // Tạo đối tượng cập nhật
            const updatedOrder = {
                firstName: firstName,
                lastName: lastName,
                phoneNumber: phone,
                address: address,
                total: total,
                status: newStatusId, // ID của trạng thái mới
            };
    
            await updateOrderStatus(orderId, updatedOrder); // Cập nhật trạng thái và các thông tin khác
            await loadOrdersToTable();
        });
    });

    // Sự kiện cho nút xem chi tiết
    document.querySelectorAll(".btn-view-details").forEach((button) => {
        button.addEventListener("click", async function () {
            const orderId = this.getAttribute("data-order-id");
            await loadOrderDetails(orderId); // Hiển thị thông tin chi tiết
        });
    });
}

// Hàm để lấy các tùy chọn cho trạng thái
async function generateStatusOptions(currentStatusId) {
    const response = await fetch(`${api}/api/v1/order-statuses`);
    const statuses = await response.json();
    
    let options = "";

    statuses.forEach((status) => {
        const isSelected = (status.id === currentStatusId) ? "selected" : "";
        options += `<option value="${status.id}" ${isSelected}>${status.name}</option>`;
    });

    return options;
}

async function updateOrderStatus(orderId, order) {
    const response = await fetch(`${api}/api/v1/orders/${orderId}`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + localStorage.getItem("token"),
        },
        body: JSON.stringify(order), // Gửi toàn bộ thông tin order
    });

    if (!response.ok) {
        throw new Error("Failed to update order");
    }
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
    const modal = new bootstrap.Modal(document.getElementById("orderDetailsModal"));
    modal.show();
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