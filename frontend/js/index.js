const product_1=document.getElementById("product_1");
async function loadProduct() {
    product_1.innerHTML="";
    const  products= await fetch(`${api}/api/v1/products`).then((res) => res.json());
    const products_quan=[];
    const products_ao=[];
    let cnt_quan=0;
    let cnt_ao=0;
    for (let i = 0; i < products.length; i += 2) {
        if (products[i].name.includes("Áo") && cnt_ao < 16) {
            cnt_ao += 1;
            products_ao.push(products[i]);
        } else if (products[i].name.includes("Quần") && cnt_quan < 16) {
            cnt_quan += 1;
            products_quan.push(products[i]);
        }
    if(cnt_ao ==16 && cnt_quan==16) break;
    }
    for(let i=0;i<16;i++){
        product_1.innerHTML+=Products_ao(products_quan[i])+Products_quan(products_ao[i]);
    }
    $('.set-bg').each(function() {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });
}
function Products_ao(product){
    return `<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals ">
    <div class="product__item">
        <div class="product__item__pic set-bg" data-setbg="${product.image}">
            <ul class="product__hover">
                <li><a href="#"><img src="img/icon/search.png" alt="" onclick="showProductDetail(${product.id})"></a></li>
            </ul>
        </div>
        <div class="product__item__text">
            <h6>${product.name}</h6>
            <a href="" class="add-cart" onclick="addToCart(${product.id})">+ Add To Cart</a>
            <h5>${numberToVnd(product.price)}</h5>
        </div>
    </div>
</div>`
};
function Products_quan(product){
    
    return `<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
    <div class="product__item">
        <div class="product__item__pic set-bg" data-setbg="${product.image}">
            <ul class="product__hover">
                <li><a href="#"><img src="img/icon/search.png" alt="" onclick="showProductDetail(${product.id})"></a></li>
            </ul>
        </div>
        <div class="product__item__text">
            <h6>${product.name}</h6>
            <a href="" class="add-cart" onclick="addToCart(${product.id})">+ Add To Cart</a>
            <h5>${numberToVnd(product.price)}</h5>
        </div>
    </div>
</div>`

};

loadProduct();

