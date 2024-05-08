const table = document.getElementById("table");
const api = "http://localhost:8081";
async function t_value(record,cnt) {

    return `<tr>
                <td>${cnt}</td>
                <td>${record.name}</td>
                <td>
                    <a href="#" class="edit" title="Edit" data-toggle="tooltip" onclick="editSize(${record.sizeId})"><i class="material-icons">&#xE254;</i></a>
                    <a href="#" class="delete" title="Delete" data-toggle="tooltip" onclick="deleteSize(${record.sizeId})"><i class="material-icons">&#xE872;</i></a>
                </td>
            </tr>`;
}

async function loadTableSize() {
    var cnt=0;
    table.innerHTML="";
    const response = await fetch(`${api}/api/v1/sizes`).then(res => res.json());
    response.forEach(async ele => {
        cnt++;
        const rowHtml = await t_value(ele,cnt);
        table.innerHTML += rowHtml;
    });
}
loadTableSize();
async function deleteSize(sizeId) {
    const confirmed = confirm("Bạn có chắc là xóa size này không?");
    if (confirmed) {
        fetch(`${api}/api/v1/sizes/${sizeId}`, {
            method: 'DELETE',
            headers: { 
                "Content-Type": "application/json",
                Accept: "application/json",
                Authorization: "Bearer " + localStorage.getItem("token")
            }
        }).then(response => {
            if (response.ok) {
                loadTableSize();
            } else {
                alert("Xóa không thành công")
            }
        });
        console.log("Size with ID " + sizeId + " has been deleted.");
    } else {
        console.log("Deletion canceled.");
    }
}
const add_size_body=document.getElementById("add_size")
function a_d(){
  return `
  <div class="row">
  <div class="col-12 grid-margin stretch-card">
      <div class="card">
          <div class="card-body">
              <h4 class="card-title">Chỉnh sửa size</h4>
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
    add_size_body.innerHTML="";
    const res = await fetch(`${api}/api/v1/sizes`).then(res => res.json());
    add_size_body.innerHTML+=a_d();
})
async function trangchu(){
  window.location.href = "size.html";
}
async function editSize(sizeId) {
    add_size_body.innerHTML="";
    const res = await fetch(`${api}/api/v1/sizes/${sizeId}`).then(res => res.json());
    add_size_body.innerHTML+=a_d1(res,sizeId);
}
function a_d1(sizes,sizeId){

    return `
    <div class="row">
    <div class="col-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Chỉnh sửa size</h4>
                    <div class="form-group">
                        <label for="Tên"><b>Tên</b></label>
                        <input type="text" class="form-control" id="name" placeholder="Tên" value="${sizes.name}" > 
                    </div>
                    <button type="button" class="btn btn-gradient-primary me-2" onclick="submit1(${sizeId})">Submit</button>
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
    try {
        const updateProduct = await fetch(`${api}/api/v1/sizes/`, {
            method: "POST",
            headers: { 
                "Content-Type": "application/json",
                Accept: "application/json",
                Authorization: "Bearer " + localStorage.getItem("token")
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
  async function submit1(sizeId) {
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
    try {
        const updateProduct = await fetch(`${api}/api/v1/sizes/${sizeId}`, {
            method: "PUT",
            headers: { 
                "Content-Type": "application/json",
                Accept: "application/json",
                Authorization: "Bearer " + localStorage.getItem("token")
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