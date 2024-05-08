// Lấy tất cả danh mục
async function getCategoriesService() {
    const response = await fetch(`${api}/api/v1/categories`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: "Bearer " + localStorage.getItem("token"), // Replace with appropriate authentication if needed
      },
    });
  
    if (!response.ok) {
      throw new Error("Failed to fetch categories");
    }
  
    const categories = await response.json();
    return categories;
}

// Lấy người dùng qua ID
async function getCategoryByIdService(id) {
    const response = await fetch(`${api}/api/v1/categories/${id}`, {
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
  
    const categories = await response.json();
    return categories;
}

// Xóa danh mục
async function deleteCategoryService(id) {
    const response = await fetch(`${api}/api/v1/categories/${id}`, {
        method: "DELETE",
        headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: "Bearer " + localStorage.getItem("token"), // Replace with appropriate authentication if needed
        },
    });

    return response;
}

function updateCategoryService(id, categoryDTO) {
    return fetch(`${api}/api/v1/categories/${id}`, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: "Bearer " + localStorage.getItem("token"),
      },
      body: JSON.stringify(categoryDTO),
    });
  }
  
  function addCategoryService(categoryDTO) {
    return fetch(`${api}/api/v1/categories`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: "Bearer " + localStorage.getItem("token"),
      },
      body: JSON.stringify(categoryDTO),
    });
  }
  

// Xử lý logic cho bảng và các nút
const categoriesTableBody = document.getElementById("categories-table-body");
let currentEditCategoryId = null;
  
function loadCategories() {
    const categoriesTableBody = document.getElementById("categories-table-body");
    getCategoriesService().then((categories) => {
      categoriesTableBody.innerHTML = "";
      categories.forEach((category, index) => {
        const row = document.createElement("tr");
        row.setAttribute("data-category-id", category.id);
        row.innerHTML = `
          <td>${index + 1}</td>
          <td>${category.name}</td>
          <td>
            <button class="btn btn-info btn_edit_category">Edit</button>
            <button class="btn btn-danger btn_delete_category">Delete</button>
          </td>
        `;
        categoriesTableBody.appendChild(row);
      });
  
      setupEditAndDelete(); // Thiết lập các nút chỉnh sửa và xóa
    });
  }
  
  // Tải các danh mục để điền vào danh sách
loadCategories();

const cancelAddCategoryButton = document.querySelector("#addCategoryModal .btn-secondary");
const confirmAddCategoryButton = document.getElementById("confirmAddCategory");
const addCategoryModalLabel = document.getElementById("addCategoryModalLabel");

confirmAddCategoryButton.addEventListener("click", async () => {
  const categoryName = document.getElementById("categoryName").value;
  const parentCategoryId = document.getElementById("parentCategory").value;

  // Chuẩn bị dữ liệu để thêm hoặc cập nhật danh mục
  const categoryDTO = {
    name: categoryName,
    parentCategory: parentCategoryId ? parseInt(parentCategoryId) : null, // Nếu không có parentCategory, đặt là null
  };

  if (currentEditCategoryId) {
    // Cập nhật danh mục
    await updateCategoryService(currentEditCategoryId, categoryDTO);
    currentEditCategoryId = null;
    addCategoryModalLabel.textContent = "Add New Category"; // Đặt lại tiêu đề modal
  } else {
    // Thêm danh mục mới
    await addCategoryService(categoryDTO);
  }

  $("#addCategoryModal").modal("hide");
  document.getElementById("addCategoryForm").reset(); // Đặt lại form
  await loadCategories(); // Cập nhật lại bảng
});

cancelAddCategoryButton.addEventListener("click", () => {
  $("#addCategoryModal").modal("hide");
  document.getElementById("addCategoryForm").reset();
  currentEditCategoryId = null;
  addCategoryModalLabel.textContent = "Add New Category";
});

function setupEditAndDelete() {
  const deleteButtons = document.querySelectorAll(".btn_delete_category");
  deleteButtons.forEach((button) => {
    button.addEventListener("click", async (e) => {
      const row = e.target.closest("tr");
      currentEditCategoryId = row.getAttribute("data-category-id");

      const confirmDelete = confirm("Are you sure you want to delete this category?");
      if (confirmDelete) {
        await deleteCategory(currentEditCategoryId);
        await loadCategories(); // Tải lại danh mục sau khi xóa
      }
    });
  });

  const editButtons = document.querySelectorAll(".btn_edit_category");
  editButtons.forEach((button) => {
    button.addEventListener("click", async (event) => {
      const row = event.target.closest("tr");
      currentEditCategoryId = row.getAttribute("data-category-id");

      addCategoryModalLabel.textContent = "Edit Category";

      const categoryName = document.getElementById("categoryName");
      const parentCategory = document.getElementById("parentCategory");

      const categoryToEdit = await getCategoryByIdService(currentEditCategoryId);

      if (categoryToEdit) {
        categoryName.value = categoryToEdit.name;
        parentCategory.value = categoryToEdit.parentCategory ? categoryToEdit.parentCategory.id : ""; 

        $("#addCategoryModal").modal("show");
      }
    });
  });
}

async function deleteCategory(id) {
    await deleteCategoryService(id);
    await loadCategories();
}

async function loadParentCategoryOptions() {
    const categories = await getCategoriesService();
    const parentCategorySelect = document.getElementById("parentCategory");
  
    // Xóa các tùy chọn trước đó để tránh trùng lặp
    parentCategorySelect.innerHTML = '<option value="">None</option>';
  
    // Lọc ra các danh mục không có parentCategory
    const rootCategories = categories.filter((category) => !category.parentCategory);
  
    // Thêm các danh mục gốc vào select box
    rootCategories.forEach((category) => {
      const option = document.createElement("option");
      option.value = category.id;
      option.textContent = category.name;
      parentCategorySelect.appendChild(option);
    });
  }
  
loadParentCategoryOptions();
  