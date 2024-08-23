

async function addCartItemService(productId) {
    const cartItems = await fetch(`${api}/api/v1/cart-items`, {
      method: "POST",
      headers: { 
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: "Bearer " + localStorage.getItem("token"),
      },
      body: JSON.stringify({
        productId: productId,
        quantity: 1,
        size: 4
      }),
    }).then((res) => res.json());
    return cartItems;
}

function addToCart(productId) {
    const cartItems = addCartItemService(productId);
    if(token=== ""){
        alert("Hãy đăng nhập");
        window.location.href = "signIn.html";
        return;
    }
    cartItems.then((data) => {
        console.log(data)
        if(data === null) {
            alert("Đã có lỗi xảy ra");
        }
        else {
            alert("Thêm vào giỏ hàng thành công");
           load();
        }
    });
}   

function showProductDetail(productId) {
    localStorage.setItem("product_id", productId.toString());
    window.location.href = "shop-details.html";
}

