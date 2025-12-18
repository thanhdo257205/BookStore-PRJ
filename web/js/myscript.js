/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.addEventListener("DOMContentLoaded", function () {

    let search = document.querySelector("#search");

    if (search) {
        search.addEventListener("click", function (e) {
            e.preventDefault();
            let form = this.closest("form");
            form.submit();
        });
    }

});

let bookInfomation = document.querySelectorAll(".infomation-book");

for (let i = 0; i < bookInfomation.length; i++) {
    bookInfomation[i].addEventListener('click', function () {
        let id = this.dataset.id;
        console.log(id);
        window.location.href = contextPath + '/BookInfomation?id=' + id;
    });
}






