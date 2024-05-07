
const container = document.getElementById('container');

// kiểm tra định dạng email
const kiemTraEmail = (email) => {
  return email.match(
    /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  );
};

//kiểm tra các trường nhập của đăng nhập
function xacnhan(event) {
  var giatriusername = document.getElementById("username").value.trim();
  var giatrimatkhau = document.getElementById("matkhau").value.trim();
  var username = document.getElementById("username");
  var matkhau = document.getElementById("matkhau");

  if (giatriusername == "") {
    username.style.border = "1px solid #ff8471";
    loi("loi_username", "Username không được bỏ trống");
  } else if (!kiemTraEmail(giatriusername)) {
    username.style.border = "1px solid #ff8471";
    loi("loi_username", "Username sai");
  } else {
    username.style.border = "1px solid #7b5be4";
    loi("loi_username", "");
  }

  if (giatrimatkhau == "") {
    matkhau.style.border = "1px solid #ff8471";
    loi("loi_mat_khau", "Mật khẩu không được bỏ trống");
  } else if (giatrimatkhau.length < 8) {
    matkhau.style.border = "1px solid #ff8471";
    loi("loi_mat_khau", "Mật khẩu phải nhiều hơn 8 kí tự");
  } else {
    matkhau.style.border = "1px solid #7b5be4";
    loi("loi_mat_khau", "");
  }

  if (
    giatriusername == "" ||
    giatrimatkhau == "" ||
    !kiemTraEmail(giatriusername) ||
    giatrimatkhau.length < 8
  ) {
    event.preventDefault();
    alert("Đăng nhập không thành công");
  } else {
    return true;
  }
}

function loi(id, message) {
  document.getElementById(id).innerHTML = message;
}

const api = "http://localhost:8081";

async function dangnhap(event) {
  event.preventDefault();
  try{
  fetch(`http://localhost:8081/api/v1/auth/signin`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      username: document.getElementById("username").value,
      password: document.getElementById("matkhau").value,
    }),
  })
    .then((res) => res.json())
    .then((dt) => {
      console.log(dt);
      localStorage.setItem("token", dt.token);
      window.location.href = "../../index.html";
    });
  }
  catch{

  }
}
