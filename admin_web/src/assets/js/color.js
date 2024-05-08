const table = document.getElementById("table");
const api = "http://localhost:8081";
async function t_value(record,cnt) {

    return `<tr>
                <td>${cnt}</td>
                <td>${record.name}</td>
                <td>
                    <a href="#" class="edit" title="Edit" data-toggle="tooltip" onclick="editColor(${record.id})"><i class="material-icons">&#xE254;</i></a>
                    <a href="#" class="delete" title="Delete" data-toggle="tooltip" onclick="deleteColor(${record.id})"><i class="material-icons">&#xE872;</i></a>
                </td>
            </tr>`;
}

async function loadTableColor() {
    var cnt=0;
    table.innerHTML="";
    const response = await fetch(`${api}/api/v1/colors`).then(res => res.json());
    response.forEach(async ele => {
        cnt++;
        const rowHtml = await t_value(ele,cnt);
        table.innerHTML += rowHtml;
    });
}
loadTableColor();
async function deleteColor(colorId) {
    const confirmed = confirm("Bạn có chắc là xóa color này không?");
    if (confirmed) {
        fetch(`${api}/api/v1/colors/${colorId}`, {
            method: 'DELETE'
        }).then(response => {
            if (response.ok) {
                loadTableColor();
            } else {
                alert("Xóa không thành công")
            }
        });
        console.log("Color with ID " + colorId + " has been deleted.");
    } else {
        console.log("Deletion canceled.");
    }
}
const add_color_body=document.getElementById("add_color")
function a_d(){
  return `
  <div class="row">
  <div class="col-12 grid-margin stretch-card">
      <div class="card">
          <div class="card-body">
              <h4 class="card-title">Chỉnh sửa color</h4>
                  <div class="form-group">
                      <label for="Tên"><b>Tên</b></label>
                      <input type="text" class="form-control" id="name" placeholder="Tên" > 
                  </div>
                  <button type="button" class="btn btn-gradient-primary me-2" onclick="submit()">Submit</button>
                  <button type="button" class="btn btn-light" onclick="trangchu()">Cancel</button>
            
          </div>
      </div>
  </div>
</div>`
}
const button_add=document.getElementById("button_add")
button_add.addEventListener("click", async function() {
    add_color_body.innerHTML="";
    const res = await fetch(`${api}/api/v1/colors`).then(res => res.json());
    add_color_body.innerHTML+=a_d();
})
async function trangchu(){
  window.location.href = "color.html";
}
async function editColor(colorId) {
    add_color_body.innerHTML="";
    const res = await fetch(`${api}/api/v1/colors/${colorId}`).then(res => res.json());
    add_color_body.innerHTML+=a_d1(res,colorId);
}
function a_d1(colors,colorId){

    return `
    <div class="row">
    <div class="col-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Chỉnh sửa color</h4>
                    <div class="form-group">
                        <label for="Tên"><b>Tên</b></label>
                        <input type="text" class="form-control" id="name" placeholder="Tên" value="${colors.name}" > 
                    </div>
                    <button type="button" class="btn btn-gradient-primary me-2" onclick="submit1(${colorId})">Submit</button>
                    <button type="button" class="btn btn-light" onclick="trangchu()">Cancel</button>
            </div>
        </div>
    </div>
  </div>`
}
async function submit() {
    // Lấy giá trị của các trường input
    const nameInput = document.getElementById('name').value;
    // Kiểm tra xem các trường input có bị để trống không
    if (nameInput === '') {
        alert('Vui lòng điền đầy đủ thông tin');
        return; 
    }
    // Tạo đối tượng JSON theo cấu trúc của ProductDTO
    const formData = {
        name: nameInput
    };
    console.log(formData); 
    // const updateProduct = await fetch(`${api}/api/v1/products/${product_id}`, {
    //     method: "PUT",
    //     headers: { 
    //       "Content-Type": "application/json",
    //       Accept: "application/json",
    //       Authorization: "Bearer " + localStorage.getItem("token")
    //     },
    //     body:formData ,
    //     }
    // )
    try {
        const updateProduct = await fetch(`${api}/api/v1/colors/`, {
            method: "POST",
            headers: { 
                "Content-Type": "application/json",
                Accept: "application/json"
            },
            body: JSON.stringify(formData) // Chuyển đối tượng JSON thành chuỗi JSON
        });
        
        if (updateProduct.ok) {
            alert("Cập nhật thành công");
            trangchu()
        } else {
            alert("Cập nhật thất bại");
        }
    } catch (error) {
        console.error("Lỗi khi gửi yêu cầu cập nhật:", error);
        alert("Cập nhật thất bại");
    }
  }
  async function submit1(colorId) {
    // Lấy giá trị của các trường input
    const nameInput = document.getElementById('name').value;
    // Kiểm tra xem các trường input có bị để trống không
    if (nameInput === '') {
        alert('Vui lòng điền đầy đủ thông tin');
        return; 
    }
    // Tạo đối tượng JSON theo cấu trúc của ProductDTO
    const formData = {
        name: nameInput
    };
    console.log(formData); 
    // const updateProduct = await fetch(`${api}/api/v1/products/${product_id}`, {
    //     method: "PUT",
    //     headers: { 
    //       "Content-Type": "application/json",
    //       Accept: "application/json",
    //       Authorization: "Bearer " + localStorage.getItem("token")
    //     },
    //     body:formData ,
    //     }
    // )
    try {
        const updateProduct = await fetch(`${api}/api/v1/colors/${colorId}`, {
            method: "PUT",
            headers: { 
                "Content-Type": "application/json",
                Accept: "application/json"
            },
            body: JSON.stringify(formData) // Chuyển đối tượng JSON thành chuỗi JSON
        });
        
        if (updateProduct.ok) {
            alert("Cập nhật thành công");
            trangchu()
        } else {
            alert("Cập nhật thất bại");
        }
    } catch (error) {
        console.error("Lỗi khi gửi yêu cầu cập nhật:", error);
        alert("Cập nhật thất bại");
    }
  }