const product_id = localStorage.getItem("product_id");
console.log(product_id);
let product_detail = null;
async function getProductDetail() {
    const response = await fetch(`${api}/api/v1/products/${product_id}`);
    product_detail = await response.json();
    insertProductDetail();
}
getProductDetail();
function insertProductDetail() {
    console.log(product_detail);
    document.getElementById("product__name").innerHTML = `
        <h4>${product_detail.name}</h4>`;
    document.getElementById("product__price").innerHTML = `
        <h3>${numberToVnd(product_detail.price)}</h3>`;
    document.getElementById("product__description").innerHTML = `
        <p>${product_detail.description}</p>`;
    document.getElementById("product__image").innerHTML = `
        <img src="${product_detail.image}" alt="">`;
    product_detail.listSizes.forEach(size => {
        document.getElementById("product__size").innerHTML += `
            <label for="${size.name}">${size.name}
                <input type="radio" id="${size.name}">
            `
        }
    );
    document.getElementById("product__materials").innerHTML = `
        <span>Materials:</span>
        <p>${product_detail.materials}</p>`;
    document.getElementById("product__instruction").innerHTML = `
        <p>${product_detail.instruction}</p>`;
    document.getElementById("product__color").innerHTML = `
        <span>Color:</span>
        <label class="c-${product_detail.color.id}" for="sp-${product_detail.color.id}">
            <input type="radio" id="sp-${product_detail.color.id}">
        `
    const add__to__cart = document.getElementById("add__to__cart")
    add__to__cart.addEventListener("click", function() {
        addToCart(product_detail.id);
    });
}

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
        size: 4,
      }),
    }).then((res) => res.json());
    return cartItems;
}

function addToCart(productId) {
    const cartItems = addCartItemService(productId);
    cartItems.then((data) => {
        if(data === null) {
            alert("Đã có lỗi xảy ra");
        }
        else {
            alert("Thêm vào giỏ hàng thành công");
        }
    }
    );
}   
