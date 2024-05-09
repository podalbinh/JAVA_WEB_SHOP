const allblog=document.getElementById("allblog");
function Blog(blog){
    let dateString = blog.createDate.toString();

    // Tạo đối tượng Date từ chuỗi thời gian
    let date = new Date(dateString);

    // // Chuyển múi giờ sang +7
    // date.setHours(date.getHours() + 7);

    // Định dạng lại ngày giờ
    let formattedDate = date.toLocaleString("en-US", {
    timeZone: "Asia/Ho_Chi_Minh",
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
    hour: "2-digit",
    minute: "2-digit",
    second: "2-digit"
    });
    return `<div class="col-lg-4 col-md-6 col-sm-6">
    <div class="blog__item">
        <div class="blog__item__pic" style="background-image: url('${blog.imageUrl}'); background-size: cover;"></div>
        <div class="blog__item__text">
            <span><img src="img/icon/calendar.png" alt=""> ${formattedDate}</span>
            <h5>${blog.title}</h5>
            <a href="blog-details.html" onclick="blog_detail(${blog.id})">Read More</a>
        </div>
    </div>
</div>`;

};

async function loadBlog() {
    allblog.innerHTML="";
    const  blogs= await fetch(`${api}/api/v1/posts`).then((res) => res.json());
    blogs.forEach(blog => {
       allblog.innerHTML+=Blog(blog);
    });
}
loadBlog();
function blog_detail(id){
    sessionStorage.setItem("blog_id",id);
}
