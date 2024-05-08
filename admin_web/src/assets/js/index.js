const orders=[
    {
      "id": 1,
      "total": 500000,
      "address": "123 Main St",
      "phone": "555-1234",
      "firstName": "John",
      "lastName": "Doe",
      "status": {
        "id": 1,
        "name": "Pending",
        "description": "Waiting for confirmation"
      },
      "orderItems": [
        {
          "id": 1,
          "quantity": 2,
          "name": "T-shirt",
          "price": 25,
          "order": "123ABC",
          "product": {
            "id": 1,
            "name": "Basic T-shirt",
            "description": "A simple t-shirt",
            "color": {
              "id": 1,
              "name": "White",
              "image": "white.jpg"
            },
            "materials": "Cotton",
            "listSizes": [
              {
                "sizeId": 1,
                "name": "Small"
              },
              {
                "sizeId": 2,
                "name": "Medium"
              },
              {
                "sizeId": 3,
                "name": "Large"
              }
            ],
            "image": "tshirt.jpg",
            "instruction": "Machine wash cold",
            "price": 25,
            "category": {
              "id": 1,
              "name": "Clothing",
              "parentCategory": "Apparel"
            }
          },
          "size": {
            "sizeId": 2,
            "name": "Medium"
          }
        }
      ],
      "user": {
        "id": 1,
        "username": "johndoe",
        "email": "john@example.com",
        "created": "2024-05-300T09:38:16.926Z",
        "phone": "555-1234",
        "providerId": "123XYZ",
        "userStatus": true,
        "listRoles": [
          {
            "roleId": 1,
            "rolename": "ROLE_USER"
          }
        ],
        "userCartItems": [
          {
            "id": 1,
            "quantity": 1,
            "product": {
              "id": 2,
              "name": "Jeans",
              "description": "Blue denim jeans",
              "color": {
                "id": 2,
                "name": "Blue",
                "image": "blue.jpg"
              },
              "materials": "Denim",
              "listSizes": [
                {
                  "sizeId": 1,
                  "name": "Small"
                },
                {
                  "sizeId": 2,
                  "name": "Medium"
                },
                {
                  "sizeId": 3,
                  "name": "Large"
                }
              ],
              "image": "jeans.jpg",
              "instruction": "Wash separately",
              "price": 50,
              "category": {
                "id": 1,
                "name": "Clothing",
                "parentCategory": "Apparel"
              }
            },
            "size": {
              "sizeId": 3,
              "name": "Large"
            }
          }
        ]
      },
      "createdAt": "2024-04-30T09:38:16.926Z",
      "updatedAt": "2024-05-07T09:38:16.926Z"
    },
    {
      "id": 2,
      "total": 30000,
      "address": "456 Oak St",
      "phone": "555-5678",
      "firstName": "Jane",
      "lastName": "Smith",
      "status": {
        "id": 2,
        "name": "Shipped",
        "description": "Items have been shipped"
      },
      "orderItems": [
        {
          "id": 2,
          "quantity": 1,
          "name": "Sweater",
          "price": 30,
          "order": "456DEF",
          "product": {
            "id": 3,
            "name": "Knit Sweater",
            "description": "Warm winter sweater",
            "color": {
              "id": 3,
              "name": "Gray",
              "image": "gray.jpg"
            },
            "materials": "Wool",
            "listSizes": [
              {
                "sizeId": 1,
                "name": "Small"
              },
              {
                "sizeId": 2,
                "name": "Medium"
              },
              {
                "sizeId": 3,
                "name": "Large"
              }
            ],
            "image": "sweater.jpg",
            "instruction": "Hand wash only",
            "price": 30,
            "category": {
              "id": 1,
              "name": "Clothing",
              "parentCategory": "Apparel"
            }
          },
          "size": {
            "sizeId": 1,
            "name": "Small"
          }
        }
      ],
      "user": {
        "id": 2,
        "username": "janesmith",
        "email": "jane@example.com",
        "created": "2024-05-07T09:38:16.926Z",
        "phone": "555-5678",
        "providerId": "456ABC",
        "userStatus": true,
        "listRoles": [
          {
            "roleId": 1,
            "rolename": "ROLE_USER"
          }
        ],
        "userCartItems": []
      },
      "createdAt": "2024-05-07T09:38:16.926Z",
      "updatedAt": "2024-05-07T09:38:16.926Z"
    },
    {
      "id": 3,
      "total": 45000,
      "address": "789 Elm St",
      "phone": "555-9012",
      "firstName": "Alice",
      "lastName": "Johnson",
      "status": {
        "id": 1,
        "name": "Pending",
        "description": "Waiting for confirmation"
      },
      "orderItems": [
        {
          "id": 3,
          "quantity": 3,
          "name": "Dress",
          "price": 15,
          "order": "789GHI",
          "product": {
            "id": 4,
            "name": "Summer Dress",
            "description": "Lightweight floral dress",
            "color": {
              "id": 4,
              "name": "Pink",
              "image": "pink.jpg"
            },
            "materials": "Cotton",
            "listSizes": [
              {
                "sizeId": 1,
                "name": "Small"
              },
              {
                "sizeId": 2,
                "name": "Medium"
              },
              {
                "sizeId": 3,
                "name": "Large"
              }
            ],
            "image": "dress.jpg",
            "instruction": "Gentle cycle",
            "price": 15,
            "category": {
              "id": 1,
              "name": "Clothing",
              "parentCategory": "Apparel"
            }
          },
          "size": {
            "sizeId": 1,
            "name": "Small"
          }
        }
      ],
      "user": {
        "id": 3,
        "username": "alicejohnson",
        "email": "alice@example.com",
        "created": "2024-05-07T09:38:16.926Z",
        "phone": "555-9012",
        "providerId": "789XYZ",
        "userStatus": true,
        "listRoles": [
          {
            "roleId": 1,
            "rolename": "ROLE_USER"
          }
        ],
        "userCartItems": []
      },
      "createdAt": "2024-05-07T09:38:16.926Z",
      "updatedAt": "2024-05-07T09:38:16.926Z"
    },
    {
      "id": 4,
      "total": 6000,
      "address": "101 Maple St",
      "phone": "555-3456",
      "firstName": "David",
      "lastName": "Brown",
      "status": {
        "id": 2,
        "name": "Shipped",
        "description": "Items have been shipped"
      },
      "orderItems": [
        {
          "id": 4,
          "quantity": 2,
          "name": "Jacket",
          "price": 30,
          "order": "101JKL",
          "product": {
            "id": 5,
            "name": "Leather Jacket",
            "description": "Classic black leather jacket",
            "color": {
              "id": 5,
              "name": "Black",
              "image": "black.jpg"
            },
            "materials": "Leather",
            "listSizes": [
              {
                "sizeId": 1,
                "name": "Small"
              },
              {
                "sizeId": 2,
                "name": "Medium"
              },
              {
                "sizeId": 3,
                "name": "Large"
              }
            ],
            "image": "jacket.jpg",
            "instruction": "Professional leather cleaning",
            "price": 30,
            "category": {
              "id": 2,
              "name": "Outerwear",
              "parentCategory": "Apparel"
            }
          },
          "size": {
            "sizeId": 3,
            "name": "Large"
          }
        }
      ],
      "user": {
        "id": 4,
        "username": "davidbrown",
        "email": "david@example.com",
        "created": "2024-05-07T09:38:16.926Z",
        "phone": "555-3456",
        "providerId": "101XYZ",
        "userStatus": true,
        "listRoles": [
          {
            "roleId": 1,
            "rolename": "ROLE_USER"
          }
        ],
        "userCartItems": []
      },
      "createdAt": "2024-05-07T09:38:16.926Z",
      "updatedAt": "2024-05-07T09:38:16.926Z"
    },
    {
      "id": 5,
      "total": 700000,
      "address": "202 Pine St",
      "phone": "555-6789",
      "firstName": "Emily",
      "lastName": "Wilson",
      "status": {
        "id": 1,
        "name": "Pending",
        "description": "Waiting for confirmation"
      },
      "orderItems": [
        {
          "id": 5,
          "quantity": 1,
          "name": "Boots",
          "price": 70,
          "order": "202MNO",
          "product": {
            "id": 6,
            "name": "Leather Boots",
            "description": "Stylish black leather boots",
            "color": {
              "id": 5,
              "name": "Black",
              "image": "black.jpg"
            },
            "materials": "Leather",
            "listSizes": [
              {
                "sizeId": 1,
                "name": "Small"
              },
              {
                "sizeId": 2,
                "name": "Medium"
              },
              {
                "sizeId": 3,
                "name": "Large"
              }
            ],
            "image": "boots.jpg",
            "instruction": "Keep away from moisture",
            "price": 70,
            "category": {
              "id": 3,
              "name": "Footwear",
              "parentCategory": "Apparel"
            }
          },
          "size": {
            "sizeId": 2,
            "name": "Medium"
          }
        }
      ],
      "user": {
        "id": 5,
        "username": "emilywilson",
        "email": "emily@example.com",
        "created": "2024-05-07T09:38:16.926Z",
        "phone": "555-6789",
        "providerId": "202ABC",
        "userStatus": true,
        "listRoles": [
          {
            "roleId": 1,
            "rolename": "ROLE_USER"
          }
        ],
        "userCartItems": []
      },
      "createdAt": "2024-05-07T09:38:16.926Z",
      "updatedAt": "2024-05-07T09:38:16.926Z"
    }
]
const user = [
    {
      "username": "alice_smith",
      "password": "alicepass",
      "email": "alice.smith@example.com",
      "phone": "555-5678",
      "created": "2024-05-07T10:17:51.300Z",
      "userStatus": true,
      "listRoles": [
        "user"
      ]
    },
    {
      "username": "bob_johnson",
      "password": "bobpass",
      "email": "bob.johnson@example.com",
      "phone": "555-9012",
      "created": "2024-05-07T10:25:15.300Z",
      "userStatus": true,
      "listRoles": [
        "user"
      ]
    },
    {
      "username": "emma_davis",
      "password": "emmapass",
      "email": "emma.davis@example.com",
      "phone": "555-3456",
      "created": "2024-05-07T10:32:40.300Z",
      "userStatus": true,
      "listRoles": [
        "user"
      ]
    },
    {
      "username": "charlie_brown",
      "password": "charliepass",
      "email": "charlie.brown@example.com",
      "phone": "555-6789",
      "created": "2024-05-07T10:40:03.300Z",
      "userStatus": true,
      "listRoles": [
        "user"
      ]
    },
    {
      "username": "olivia_taylor",
      "password": "oliviapass",
      "email": "olivia.taylor@example.com",
      "phone": "555-1234",
      "created": "2024-05-07T10:47:27.300Z",
      "userStatus": true,
      "listRoles": [
        "user"
      ]
    }
  ]
  
const api = "http://localhost:8081";
const doanh_thu = document.getElementById("doanh_thu");
const orders_week = document.getElementById("orders_week");
const total_user = document.getElementById("total_user");
async function load_orders() {
    // const response = await fetch(`${api}/api/v1/orders`, {
    //   method: "GET",
    //   headers: { 
    //     "Content-Type": "application/json",
    //     Accept: "application/json",
    //     Authorization: "Bearer " + localStorage.getItem("token"),
    //   },
    // }).then((res)=> res.json());
    // const response1 = await fetch(`${api}/api/users`, {
    //   method: "GET",
    //   headers: { 
    //     "Content-Type": "application/json",
    //     Accept: "application/json",
    //     Authorization: "Bearer " + localStorage.getItem("token"),
    //   },
    // }).then((res)=> res.json());
    // Lấy ngày hiện tại
    const currentDate = new Date();
    // Tìm ngày đầu tiên của tuần hiện tại (tính từ ngày thứ hai)
    const firstDayOfWeek = new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate() - currentDate.getDay() + 1);
    // Tìm ngày cuối cùng của tuần hiện tại (tính từ ngày Chủ nhật)
    const lastDayOfWeek = new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate() + (6 - currentDate.getDay() + 1));
    // Chuyển đổi ngày thành định dạng chuỗi ISO (YYYY-MM-DD)
    const formattedFirstDayOfWeek = firstDayOfWeek.toISOString().split('T')[0];
    const formattedLastDayOfWeek = lastDayOfWeek.toISOString().split('T')[0];
    // Lọc ra các đơn hàng có ngày tạo trong khoảng thời gian của tuần hiện tại
    const ordersInCurrentWeek = orders.filter(order => {
        const orderDate = new Date(order.createdAt);
        return orderDate >= firstDayOfWeek && orderDate <= lastDayOfWeek;
    });
    let total_weak = 0;
    ordersInCurrentWeek.forEach((ele) => (total_weak+=ele.total));
    doanh_thu.innerHTML+=doanh_thu_tuan(total_weak);
    orders_week.innerHTML+=order_tuan(ordersInCurrentWeek.length);
    total_user.innerHTML+=nguoi_dung(user.length);
}
function numberToVnd(number) {
    var formatter = new Intl.NumberFormat("vn-VN", {
      style: "currency",
      currency: "VND",
    });
    return formatter.format(number);
  }
function doanh_thu_tuan(total_weak){
    return ` <h2 class="mb-5">${numberToVnd(total_weak)}</h2>`;
}
function order_tuan(total_orders){
    return ` <h2 class="mb-5">${total_orders}</h2>`
}
function nguoi_dung(total_user){
    return ` <h2 class="mb-5">${total_user}</h2>`
}
load_orders();
const table = document.getElementById("table");

async function t_value(record,cnt) {
    // Tạo một chuỗi để chứa HTML cho mỗi size
    const sizesHTML = record.listSizes.map(size => `<li>${size.name}</li>`).join('');
    
    // Tạo HTML cho cột listSizes
    const listSizesHTML = `<ul>${sizesHTML}</ul>`;

    return `<tr>
                <td>${cnt}</td>
                <td>${record.name}</td>
                <td>${record.category.name} (${record.category.parentCategory.name})</td>
                <td>${listSizesHTML}</td> <!-- Thêm HTML của listSizes vào cột -->
                <td>${numberToVnd(record.price)}</td>
                <td>
                    <a href="#" class="edit" title="Edit" data-toggle="tooltip" onclick="editProduct(${record.id})"><i class="material-icons">&#xE254;</i></a>
                    <a href="#" class="delete" title="Delete" data-toggle="tooltip" onclick="deleteProduct(${record.id})"><i class="material-icons">&#xE872;</i></a>
                </td>
            </tr>`;
}

async function loadTableProduct() {
    var cnt=0;
    table.innerHTML="";
    const response = await fetch(`${api}/api/v1/products`).then(res => res.json());
    response.forEach(async ele => {
        cnt++;
        const rowHtml = await t_value(ele,cnt);
        table.innerHTML += rowHtml;
    });
}
loadTableProduct();
const searchInput= document.getElementById("search")
searchInput.addEventListener("input", async () => {
    const searchValue = searchInput.value.toLowerCase();
        const querySearch=searchInput.value;
        const res1 = await fetch(`${api}/api/v1/products/search?query=${querySearch}`)
        .then(res => res.json());
        let cnt=0;
        table.innerHTML="";
        res1.forEach(async ele => {
            cnt++;
            const rowHtml1 = await t_value(ele,cnt);
            table.innerHTML += rowHtml1;
        });
    }
)
async function deleteProduct(productId) {
    const confirmed = confirm("Bạn có chắc là xóa sản phẩm này không?");
    if (confirmed) {
        fetch(`${api}/api/v1/products/${productId}`, {
            method: 'DELETE'
        }).then(response => {
            if (response.ok) {
                loadTableProduct();
            } else {
                alert("Xóa không thành công")
            }
        });
        console.log("Product with ID " + productId + " has been deleted.");
    } else {
        console.log("Deletion canceled.");
    }
}
const add_product_body=document.getElementById("add_product")
function a_d(categories,sizes,colors){
  let options1 = "";
     sizes.forEach(size => {
       
            options1 +=  `<tr>
                            <td><input type="checkbox" id="${size.sizeId}" name="${size.name} value="${size.sizeId}"">  <label for="${size.name}">${size.name}</label></td>
                        </tr>`;
    });
    let options = "";
     categories.forEach(category => {
      if(category.parentCategory!==null){
        options +=  `<option value="${category.id}" >${category.name} (${category.parentCategory.name})</option>`;
    }});
    let options2 = "";
     colors.forEach(color => {
     options2 +=  `<option value="${color.id}">${color.name} </option>`;
    });
  return `
  <div class="row">
  <div class="col-12 grid-margin stretch-card">
      <div class="card">
          <div class="card-body">
              <h4 class="card-title">Chỉnh sửa sản phẩm</h4>
                  <div class="form-group">
                      <label for="Tên sản phẩm"><b>Tên sản phẩm</b></label>
                      <input type="text" class="form-control" id="name" placeholder="Tên sản phẩm" >
                  </div>
                  <div class="form-group">
                      <label for="Mô tả"><b>Mô tả</b></label>
                      <input type="text" class="form-control" id="description" placeholder="Mô tả">
                  </div>
                  <div class="form-group">
                      <label for="Vật liệu"><b>Vật liệu</b></label>
                      <input type="text" class="form-control" id="materials" placeholder="Vật liệu" >
                  </div>
                  <div class="form-group">
                      <label for="Hướng dẫn"><b>Hướng dẫn</b></label>
                      <input type="text" class="form-control" id="instruction" placeholder="Hướng dẫn" >
                  </div>
                  <div class="form-group">
                      <label for="Giá"><b>Giá</b></label>
                      <input type="text" class="form-control" id="price" placeholder="Giá" >
                  </div>
                  <div class="form-group">
                      <label for="image"><b>Ảnh</b></label>
                      <input type="text" class="form-control" id="image" placeholder="Ảnh" >
                  </div>
                  <div class="form-group">
                      <label for="Loại"><b>Loại</b></label>
                      <select class="form-select">
                          ${options}
                      </select>
                  </div>   
                  <label for="Kích cỡ"><b>Kích cỡ</b></label>
                  <div class="form-check-label" >
                      <table>
                      ${options1}
                      </table>
                  </div>
                  <div class="form-group">
                      <label for="Màu"><b>Màu</b></label>
                      <select class="form-select">
                          ${options2}
                      </select>
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
  add_product_body.innerHTML="";
    const res2 = await fetch(`${api}/api/v1/categories`).then(res => res.json());
    const res3 = await fetch(`${api}/api/v1/sizes`).then(res => res.json());
    const res4 = await fetch(`${api}/api/v1/colors`).then(res => res.json());
    add_product_body.innerHTML+=a_d(res2,res3,res4);
})
async function trangchu(){
  window.location.href = "index.html";
}
async function submit() {

  // Lấy giá trị của các trường input
  const nameInput = document.getElementById('name').value;
  const descriptionInput = document.getElementById('description').value;
  const materialsInput = document.getElementById('materials').value;
  const instructionInput = document.getElementById('instruction').value;
  const imageInput = document.getElementById('image').value;
  const priceInput = document.getElementById('price').value;

  // Lấy giá trị của category đã chọn
  const categorySelect = document.querySelector('.form-select'); 
  const selectedCategory = categorySelect.options[categorySelect.selectedIndex].value;

  // Lấy giá trị của color đã chọn
  const colorSelect = document.querySelectorAll('.form-select')[1]; 
  const selectedColor = colorSelect.options[colorSelect.selectedIndex].value;

  // Lấy tất cả các size đã được chọn
  const selectedSizes = [];
  const checkboxes = document.querySelectorAll('input[type="checkbox"]:checked'); 
  checkboxes.forEach(checkbox => {
      selectedSizes.push(
          parseInt(checkbox.id)
      )
  });

  // Kiểm tra xem các trường input có bị để trống không
  if (nameInput === '' || descriptionInput === '' || materialsInput === '' || instructionInput === '' || priceInput === '') {
      alert('Vui lòng điền đầy đủ thông tin');
      return; 
  }
  
  // Tạo đối tượng JSON theo cấu trúc của ProductDTO
  const formData = {
      name: nameInput,
      description: descriptionInput,
      color:parseInt(selectedColor), // Đảm bảo rằng selectedColor là id của màu sắc
      materials: materialsInput,
      image: imageInput,
      listSizes: selectedSizes,
      instruction: instructionInput,
      price: parseInt(priceInput), // Đảm bảo rằng giá là kiểu BigInt
      category: parseInt(selectedCategory) // Đảm bảo rằng selectedCategory là id của danh mục
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
      const updateProduct = await fetch(`${api}/api/v1/products/`, {
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
function product_detail1(product, categories,sizes,colors,productId) {
  let options1 = "";
  const sizeArray = product.listSizes.map(size => size.sizeId);

   sizes.forEach(size => {
      if (sizeArray.includes(size.sizeId)) {
          options1 +=  `<tr>
                          <td><input type="checkbox" id="${size.sizeId}" name="${size.name}" checked value="${size.sizeId}"> <label for="${size.name}">${size.name}</label></td>
                      </tr>`;
      } else {
          options1 +=  `<tr>
                          <td><input type="checkbox" id="${size.sizeId}" name="${size.name} value="${size.sizeId}"">  <label for="${size.name}">${size.name}</label></td>
                      </tr>`;
      }
  });
  let options = "";
   categories.forEach(category => {
      if(category.parentCategory!==null){
          if(category.name === product.category.name) {
          options +=  `<option selected value="${category.id}">${category.name} (${category.parentCategory.name})</option>`;
          }
          else options +=  `<option value="${category.id}" >${category.name} (${category.parentCategory.name})</option>`;
  }});
  let options2 = "";
   colors.forEach(color => {
     
          if(color.name === product.color.name) {
          options2 +=  `<option selected value="${color.id}">${color.name}</option>`;
          }
          else options2 +=  `<option value="${color.id}">${color.name} </option>`;
  });
 return `<div class="row">
      <div class="col-12 grid-margin stretch-card">
          <div class="card">
              <div class="card-body">
                  <h4 class="card-title">Chỉnh sửa sản phẩm</h4>
                 
                      <div class="form-group">
                          <label for="Tên sản phẩm"><b>Tên sản phẩm</b></label>
                          <input type="text" class="form-control" id="name" placeholder="Tên sản phẩm" value="${product.name}">
                      </div>
                      <div class="form-group">
                          <label for="Mô tả"><b>Mô tả</b></label>
                          <input type="text" class="form-control" id="description" placeholder="Mô tả" value="${product.description}">
                      </div>
                      <div class="form-group">
                          <label for="Vật liệu"><b>Vật liệu</b></label>
                          <input type="text" class="form-control" id="materials" placeholder="Vật liệu" value="${product.materials}">
                      </div>
                      <div class="form-group">
                          <label for="Hướng dẫn"><b>Hướng dẫn</b></label>
                          <input type="text" class="form-control" id="instruction" placeholder="Hướng dẫn" value="${product.instruction}">
                      </div>
                      <div class="form-group">
                          <label for="Giá"><b>Giá</b></label>
                          <input type="text" class="form-control" id="price" placeholder="Giá" value="${product.price}">
                      </div>
                      <div class="form-group">
                          <label for="image"><b>Ảnh</b></label>
                          <input type="text" class="form-control" id="image" placeholder="Ảnh" value="${product.image}">
                      </div>
                      <div class="form-group">
                          <label for="Loại"><b>Loại</b></label>
                          <select class="form-select">
                              ${options}
                          </select>
                      </div>   
                      <label for="Kích cỡ"><b>Kích cỡ</b></label>
                      <div class="form-check-label" >
                          <table>
                          ${options1}
                          </table>
                      </div>
                      <div class="form-group">
                          <label for="Màu"><b>Màu</b></label>
                          <select class="form-select">
                              ${options2}
                          </select>
                      </div>   
                   
                      <button type="button" class="btn btn-gradient-primary me-2" onclick="submit1(${productId})">Submit</button>
                      <button type="button" class="btn btn-light" onclick="trangchu()">Cancel</button>
                
              </div>
          </div>
      </div>
  </div>`;
}
async function editProduct(productId) {
  add_product_body.innerHTML="";
  const res1 = await fetch(`${api}/api/v1/products/${productId}`).then(res => res.json());
  const res2 = await fetch(`${api}/api/v1/categories`).then(res => res.json());
  const res3 = await fetch(`${api}/api/v1/sizes`).then(res => res.json());
  const res4 = await fetch(`${api}/api/v1/colors`).then(res => res.json());
  add_product_body.innerHTML+=product_detail1(res1,res2,res3,res4,productId);
}

async function submit1(productId) {

  // Lấy giá trị của các trường input
  const nameInput = document.getElementById('name').value;
  const descriptionInput = document.getElementById('description').value;
  const materialsInput = document.getElementById('materials').value;
  const instructionInput = document.getElementById('instruction').value;
  const imageInput = document.getElementById('image').value;
  const priceInput = document.getElementById('price').value;

  // Lấy giá trị của category đã chọn
  const categorySelect = document.querySelector('.form-select'); 
  const selectedCategory = categorySelect.options[categorySelect.selectedIndex].value;

  // Lấy giá trị của color đã chọn
  const colorSelect = document.querySelectorAll('.form-select')[1]; 
  const selectedColor = colorSelect.options[colorSelect.selectedIndex].value;

  // Lấy tất cả các size đã được chọn
  const selectedSizes = [];
  const checkboxes = document.querySelectorAll('input[type="checkbox"]:checked'); 
  checkboxes.forEach(checkbox => {
      selectedSizes.push(
          parseInt(checkbox.id)
      )
  });

  // Kiểm tra xem các trường input có bị để trống không
  if (nameInput === '' || descriptionInput === '' || materialsInput === '' || instructionInput === '' || priceInput === '') {
      alert('Vui lòng điền đầy đủ thông tin');
      return; 
  }
  
  // Tạo đối tượng JSON theo cấu trúc của ProductDTO
  const formData = {
      id: parseInt(productId),
      name: nameInput,
      description: descriptionInput,
      color:parseInt(selectedColor), // Đảm bảo rằng selectedColor là id của màu sắc
      materials: materialsInput,
      image: imageInput,
      listSizes: selectedSizes,
      instruction: instructionInput,
      price: parseInt(priceInput), // Đảm bảo rằng giá là kiểu BigInt
      category: parseInt(selectedCategory) // Đảm bảo rằng selectedCategory là id của danh mục
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
      const updateProduct = await fetch(`${api}/api/v1/products/${productId}`, {
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
