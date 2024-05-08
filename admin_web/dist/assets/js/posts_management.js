async function getPostsService() {
    const response = await fetch(`${api}/api/v1/posts`, {
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
  
    const posts = await response.json();
    return posts;
}

// Lấy người dùng qua ID
async function getPostByIdService(id) {
  const response = await fetch(`${api}/api/v1/posts/${id}`, {
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

  const post = await response.json();
  return post;
}

// Thêm người dùng mới
async function addPostService(post) {
  const response = await fetch(`${api}/api/v1/posts`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Accept: "application/json",
      Authorization: "Bearer " + localStorage.getItem("token"),
    },
    body: JSON.stringify(post),
  });

  if (!response.ok) {
    throw new Error("Failed to add user");
  }

  const newPost = await response.json();
  return newPost;
}

// Xóa bài viết
async function deletePostsService(id) {
    const response = await fetch(`${api}/api/v1/posts/${id}`, {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: "Bearer " + localStorage.getItem("token"),
      },
    });

    return response;
}

//Cập nhật bài viết
async function updatePostService(id, title, desc, imageUrl) {
    const posts = await fetch(`${api}/api/v1/posts/${id}`, {
      method: "PUT",
      headers: { 
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: "Bearer " + localStorage.getItem("token")
      },
      body: JSON.stringify({
        title: title,
        body: desc,
        imageUrl: imageUrl
      }),
    });
    const updatedPost = await posts.json();
    return updatedPost;
}

let currentEditPostId = null;

const postsTableBody = document.getElementById("posts-table-body");
async function loadPosts() {
    const posts = await getPostsService();
    postsTableBody.innerHTML = "";
    console.log(posts);
    posts.forEach((post, index) => {
        console.log(post.comments);
        const row = document.createElement("tr");
        row.setAttribute("data-post-id", post.id);
        row.innerHTML = `
              <td>${index + 1}</td>
              <td class="limited-title">${post.title}</td>
              <td class="limited-body">${post.body}</td>
              <td>${new Date(post.createDate).toLocaleDateString()}</td>
              <td>${post.comments.length}</td>
              <td>
                <button class="btn btn-info btn_edit_post"">Edit</button>
                <button class="btn btn-danger btn_delete_post"">Delete</button>
              </td>
            `;
            postsTableBody.appendChild(row);
    });

    setupEditAndDelete();
}

loadPosts();

// Tham chiếu tới các phần tử trong modal
const confirmAddPostButton = document.getElementById("confirmAddPost");
const cancelAddPostButton = document.querySelector("#addPostModal .btn-secondary");

// Sự kiện nhấn nút Confirm trong modal
confirmAddPostButton.addEventListener("click", async () => {
  const postTitle = document.getElementById("postTitle").value;
  const postBody = document.getElementById("postBody").value;
  const postImageUrl= document.getElementById("postImageUrl").value;

  if (currentEditPostId) { // Nếu đang chỉnh sửa
    await updatePostService(currentEditPostId, postTitle, postBody, postImageUrl);
    currentEditPostId = null; // Đặt lại sau khi chỉnh sửa
    addPostModalLabel.textContent = "Add New Post"; // Đặt lại tiêu đề
  } else { // Nếu là thêm mới
    const newPost = { postTitle, postBody, postImageUrl};
    await addPostService(newPost);
  }

  // Đóng modal và đặt lại các trường
  $("#addPostModal").modal("hide");
  document.getElementById("addPostForm").reset(); // Đặt lại form
  await loadPosts(); // Cập nhật lại bảng
});

// Sự kiện nhấn nút Cancel
cancelAddPostButton.addEventListener("click", () => {
    $("#addPostModal").modal("hide"); // Đóng modal
    document.getElementById("addPostForm").reset(); // Đặt lại các trường
    currentEditPostId = null;
    addUserModalTitle.textContent = "Add New Posts"; 
});

async function deletePost(postId) {
  await deletePostsService(postId);
  await loadPosts();
}

const addPostModalLabel = document.getElementById("addPostModalLabel");

function setupEditAndDelete() {
  const deleteButtons = document.querySelectorAll(".btn_delete_post")
  console.log(deleteButtons);
  deleteButtons.forEach((button) => {
    button.addEventListener("click", async (e) => {
      const row = e.target.closest("tr"); // Tìm hàng chứa nút
      currentEditPostId = row.getAttribute("data-post-id"); // Lấy ID
      const confirmDelete = confirm("Bạn có chắc chắn muốn xóa bài viết này?");
      if (confirmDelete) {
        await deletePost(currentEditPostId);
      }
    })
  });

  // Sử dụng `document.querySelectorAll` để lấy tất cả nút "Edit"
  const editButtons = document.querySelectorAll(".btn_edit_post");
  console.log(editButtons);
  // Gắn sự kiện cho mỗi nút "Edit"
  editButtons.forEach((editButton) => {
    editButton.addEventListener("click", async (event) => {
      const row = event.target.closest("tr"); // Tìm hàng chứa nút
      currentEditPostId = row.getAttribute("data-post-id"); // Lấy ID
      // console.log("Edit User ID:", currentEditUserId);

      // Đặt lại tiêu đề modal
      addPostModalLabel.textContent = "Edit Post";

      // Lấy các trường cần điền
      const postTitleInput = document.getElementById("postTitle");
      const postBodyInput = document.getElementById("postBody");
      const postImageUrlInput = document.getElementById("postImageUrl");

      // Lấy dữ liệu người dùng từ API theo ID
      const postToEdit = await getPostByIdService(currentEditPostId);
      console.log("Post to Edit:", postToEdit);

      if (postToEdit) {
        // Ẩn nhãn và trường
        postTitleInput.value = postToEdit.title; // Điền thông tin
        postBodyInput.value = postToEdit.body;
        postImageUrlInput.value = postToEdit.imageUrl;
        // Hiển thị modal
        $("#addPostModal").modal("show");
      }
    });
  });
}