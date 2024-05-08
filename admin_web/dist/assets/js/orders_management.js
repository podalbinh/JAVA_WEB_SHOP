// Lấy tất cả đơn hàng từ API
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

// Cập nhật bảng với dữ liệu đơn hàng
async function loadOrdersToTable() {
    const orders = await getAllOrders(); // Lấy danh sách đơn hàng từ API
    const tableBody = document.querySelector("table.table-striped tbody"); // Lấy phần thân của bảng
    
    tableBody.innerHTML = ""; // Xóa nội dung cũ

    orders.forEach((order, index) => {
        const row = document.createElement("tr");
        
        // Thêm thông tin vào hàng mới
        row.innerHTML = `
            <td>${index + 1}</td>  <!-- Số thứ tự -->
            <td>${order.firstName} ${order.lastName}</td>  <!-- Tên người đặt -->
            <td>${order.phone}</td>  <!-- Số điện thoại -->
            <td>${order.address}</td>  <!-- Địa chỉ -->
            <td>${order.total}</td>  <!-- Tổng giá trị đơn hàng -->
        `;

        tableBody.appendChild(row); // Thêm hàng vào bảng
    });
}

// Gọi hàm để cập nhật bảng khi trang được tải
document.addEventListener("DOMContentLoaded", loadOrdersToTable);