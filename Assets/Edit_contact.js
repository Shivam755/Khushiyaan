let id = (id) => document.getElementById(id);

let classes = (classes) => document.getElementsByClassName(classes);

let phone = id("phone"),
    email = id("email"),
    regaddrs = id("regaddrs"),
    offaddrs = id("offaddrs"),
    fburl = id("fburl"),
    twurl = id("twurl"),
    igurl = id("igurl"),
    form = id("form"),


    errorMsg = classes("error"),
    successIcon = classes("success-icon"),
    failureIcon = classes("failure-icon");

form.addEventListener("submit", (e) => {
    e.preventDefault();

    engine(phone, 0, "contact cannot be blank");
    engine(email, 1, "Email cannot be blank");
    engine(regaddrs, 2, "address cannot be blank");
    engine(offaddrs, 3, "Address cannot be blank");
    engine(fburl, 4, "url cannot be blank");
    engine(twurl, 5, "url cannot be blank");
    engine(igurl, 6, "url cannot be blank");

});

let engine = (id, serial, message) => {
    if (id.value.trim() === "") {
        errorMsg[serial].innerHTML = message;
        id.style.border = "2px solid red";

        // icons
        failureIcon[serial].style.opacity = "1";
        successIcon[serial].style.opacity = "0";
    } else {
        errorMsg[serial].innerHTML = "";
        id.style.border = "2px solid green";

        // icons
        failureIcon[serial].style.opacity = "0";
        successIcon[serial].style.opacity = "1";
    }
};