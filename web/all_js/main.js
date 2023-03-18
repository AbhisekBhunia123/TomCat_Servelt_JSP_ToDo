let allbtn = document.querySelectorAll("button");

allbtn.forEach((e) => {
    e.addEventListener("click", (x) => {
        x.preventDefault();
        console.log("Hello");
        const xhttp = new XMLHttpRequest();
        xhttp.onload = function () {
            let data = this.responseText;
            console.log(data);
            location.reload();
        };
        xhttp.open("GET", "deletedata?id="+e.id, true);
        xhttp.send();
    });
});


