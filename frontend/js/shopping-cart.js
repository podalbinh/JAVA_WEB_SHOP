async function getCartItemsService() {
  const response = await fetch(`${api}/api/v1/cart-items`, {
    method: "GET",
    headers: { 
      "Content-Type": "application/json",
      Accept: "application/json",
      Authorization: "Bearer " + localStorage.getItem("token"),
    },
  });
  const cartItems = response.json();
  return cartItems;
}

async function removeCartItemService(cartItemId) {
  const cartItems = await fetch(`${api}/api/v1/cart-items/${cartItemId}`, {
    method: "DELETE",
    headers: { 
      "Content-Type": "application/json",
      Accept: "application/json",
      Authorization: "Bearer " + localStorage.getItem("token"),
    },
  });
  return cartItems;
}

async function updateCartItemService(cartItemId, quantity, size) {
  const cartItems = await fetch(`${api}/api/v1/cart-items/${cartItemId}`, {
    method: "PUT",
    headers: { 
      "Content-Type": "application/json",
      Accept: "application/json",
      Authorization: "Bearer " + localStorage.getItem("token")
    },
    body: JSON.stringify({
      quantity: quantity,
      size: size
    }),
  }).then((res) => res.json());
  return cartItems;
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
      size: 4
    }),
  }).then((res) => res.json());
  return cartItems;
}

let listCart = getCartItem();
async function getCartItem() {
    const carts = await getCartItemsService();
    listCart = carts;
    return carts;
}



getCartItem();
async function generateSizeButtons(cart) {
  var cartId = cart?.id;
  var sizePId = "sizeProduct_" + cartId;
  const size_ProductId = document.getElementById(sizePId);
  if (size_ProductId) {
    size_ProductId.innerHTML = `<option value="${cart?.size?.sizeId}">${cart?.size?.name}</option>`;
    cart?.product?.listSizes.forEach((c) => {
      if(c.sizeId != cart?.size?.sizeId) {
        size_ProductId.innerHTML += `<option value="${c.sizeId}">${c.name}</option>`;
      }
    });
  }
}

function cartItem(cart) {
  console.log(cart.size);
  return `
  <tr>
    <td class="product__cart__item">
      <div class="product__cart__item__pic">
        <img src="${cart?.product?.image}" alt="" width="100px" height="100px" object-fit="cover">
      </div>
      <div class="product__cart__item__text">
        <h6>${cart?.product?.name}</h6>
        <label for="size_choice">Chọn size của bạn:</label>
        <select onchange="textChange1(${cart.id}, ${cart?.size?.sizeId})" name="size" id="sizeProduct_${cart.id}">

        </select>
      </div>
    </td>
    <td class="quantity__item">
      <div class="quantity">
        <div class="pro-qty-2">
          <button onclick="updateSL(${cart.id},${-1})">-</button>
          <input class="${cart.id}" onchange="textChange(${cart.id}, ${cart.size})" type="text" value="${cart.quantity}">
          <button onclick="updateSL(${cart.id},${1})">+</button>
        </div>
      </div>
    </td>
    <td class="cart__price">
      <span class="text-xs font-medium cart__price${cart.id}">
        ${numberToVnd(cart?.quantity * cart?.product?.price)}
      </span>
    </td>
    <td class="cart__close"><button onclick="removeItem(${cart.id})" class="fa fa-close"></button></td>
  </tr>

  `;
}

  
async function loadCart() {
  document.getElementById("cart-items").innerHTML = "";
  await getCartItem();
  let total = 0;
  const carts = listCart;
  if (Array.isArray(carts)) {
    carts.forEach((c) => {
      $("#cart-items").append(cartItem(c));
      generateSizeButtons(c);
      total += parseInt(c?.quantity || 0) * parseInt(c?.product?.price || 0);
    });
  }
  updateTotal();
}
loadCart();
async function updateTotal() {
  let total = 0;
  if (Array.isArray(listCart)) {
    listCart.forEach((c) => {
      $(`.cart__total${c?.id}`).html(numberToVnd(c?.quantity * c?.product?.price));
      total += parseInt(c?.quantity || 0) * parseInt(c?.product?.price || 0);
    });
  }
  document.querySelector(".total_money").innerHTML = numberToVnd(total);
}


async function updateSL(id,dau, size) {
  let quantity = Number($(`.${id}`).val());
  size = $(`#sizeProduct_${id}`).val();
  console.log($(`#sizeProduct_${id}`).val());
  if (quantity > 1 && dau <0)
  {
    quantity = quantity+dau;
    const res = await updateCartItemService(id, quantity, size);
    console.log(res);
    $(`.${id}`).val(quantity);
    $(`.${id}`).html(quantity);
  }
  else 
  if (quantity<999 && dau >0)
  {
    quantity = quantity +dau;
    const res = await updateCartItemService(id, quantity, size);
    console.log(res);
    $(`.${id}`).val(quantity);
    $(`.${id}`).html(quantity);
  }
  else if (dau ==0)
  {
    const res = await updateCartItemService(id, quantity, size);
    console.log(res);
    $(`.${id}`).val(quantity);
    $(`.${id}`).html(quantity);
  }
  loadCart();
  for (let i =0;i<listCart.length;i++)
    if (listCart[i].id == id) listCart[i].quantity = quantity;
  updateTotal();
}

async function textChange1(id, size) {
  console.log(size);
  await updateSL(id,0, size);
}

async function textChange(id, size) {
  quantity = $(`.${id}`).val();
  $(`.${id}`).html(quantity);
  await updateSL(id,0, size);
}

async function removeItem(id) {
  const res = await removeCartItemService(id);
  loadCart();
  updateTotal();
}

$(document).on('click', '.update-cart', async function () {
  await updateCart();
  location.reload();
});

async function updateCart() {
  loadCart();
  updateTotal();
}
