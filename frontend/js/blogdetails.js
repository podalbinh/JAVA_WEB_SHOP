
function title(blog,comment){
    let dateString = blog.createDate.toString();

    // Tạo đối tượng Date từ chuỗi thời gian
    let date = new Date(dateString);
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
    return ` <div class="container">
    <div class="row d-flex justify-content-center">
        <div class="col-lg-9 text-center">
            <div class="blog__hero__text">
                <h2>${blog.title}</h2>
                <ul>
                    <li>${formattedDate}</li>
                    <li>${comment.length}Comments</li>
                </ul>
            </div>
        </div>
    </div>
</div>`
}
function image1(){
    return `<img src="img/blog/details/blog-details.jpg" alt="">`
}
function image(blog){
    return `<img src="${blog.imageUrl}" alt="">`
}
function text(text){
    return `<p>${text}</p>`
}
const blog_detail_title=document.getElementById("section_title")
const blog_detail_image=document.getElementById("image")
const blog_detail_text=document.getElementById("text")
const blog_id = sessionStorage.getItem("blog_id");
function splitIntoTwoSentences(text) {
    const sentences = text.match(/[^.!?]+[.!?]+/g); // Tách văn bản thành các câu

    let result = [];
    let temp = [];

    for (let i = 0; i < sentences.length; i++) {
        temp.push(sentences[i]); // Thêm câu vào mảng tạm

        if (temp.length === 2 || i === sentences.length - 1) {
            result.push(temp.join('')); // Kết hợp 2 câu vào một đoạn và thêm vào mảng kết quả
            temp = []; // Đặt lại mảng tạm
        }
    }

    return result;
}
const text2 = "This is sentence one. This is sentence two. This is sentence three! This is sentence four?";
async function loadBlogDetail() {
    blog_detail_title.innerHTML="";
    blog_detail_image.innerHTML="";
    blog_detail_text.innerHTML="";
    const  listComment= await fetch(`${api}/api/v1/comments/all/${BigInt(blog_id)}`).then((res) => res.json());
    const  blogdetail= await fetch(`${api}/api/v1/posts/${BigInt(blog_id)}`).then((res) => res.json());
    blog_detail_title.innerHTML+=title(blogdetail,listComment);
    blog_detail_image.innerHTML+=image1();
    const result = splitIntoTwoSentences(blogdetail.body);
    result.forEach(text_sub =>  blog_detail_text.innerHTML+=text(text_sub))
}
function comment(comment){
    let dateString = comment.createdAt.toString();

    // Tạo đối tượng Date từ chuỗi thời gian
    let date = new Date(dateString);
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
    return `
    <div class="d-flex flex-row user-info"><img class="rounded-circle" src="img/batman.png" width="40">
    <div class="d-flex flex-column justify-content-start ml-2"><span class="d-block font-weight-bold name">${comment.user.username}</span>
        <span class="text-black-50">${formattedDate}</span></div>
</div>
<div class="mt-2">
    <p class="comment-text">${comment.body}</p>
</div>`
}
const listcommets = document.getElementById("comment")
async function loadComment(){
    listcommets.innerHTML="";
    const  listComment= await fetch(`${api}/api/v1/comments/all/${BigInt(blog_id)}`).then((res) => res.json());
    console.log(listComment);
    listComment.forEach(element => listcommets.innerHTML+=comment(element))
}
function addcomment(){
    if( document.getElementById("text_comment").value  ===""){
        alert("Hãy viết một thứ gì đó")
        return;
    }
    let currentDate = new Date();
    fetch(`${api}/api/v1/comments`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: "Bearer " + localStorage.getItem("token")
    },
    body: JSON.stringify({ 
        postId: blog_id,
        body: document.getElementById("text_comment").value
    }),
  }).then((res) => res.json())
  .then((data) => {
    document.getElementById("text_comment").value  =""
    loadComment();
});
}
loadComment();
loadBlogDetail();
