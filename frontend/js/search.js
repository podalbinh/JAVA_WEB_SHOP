const shop_search = document.getElementById("product_search");
const search_result = document.getElementById("search_result");
async function searchProduct() {
    let query=localStorage.getItem('query');
    const products = await fetch(`${api}/api/v1/products/search?query=${query}`)
    const data=await products.json();
    console.log(data);
    search_result.innerHTML += `<p>Kết quả tìm kiếm của: ${query}</p>`;
    try {
        
        data.forEach(element => {
            shop_search.innerHTML += `
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                    <div data-setbg="${element.image}" class="product__item__pic set-bg" data width="260" height="260">
                        <ul class="product__hover">
                            <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>${element.name}</h6>
                        <a href="#" class="add-cart">+ Add To Cart</a>
                        <h5>${element.price}</h5>
                    </div>
                </div>
            </div>
            `;
        });
    }
    catch (error) {
        console.error("Error fetching product data:", error);
    }
    $('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });
}
searchProduct();

