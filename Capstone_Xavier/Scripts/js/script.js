
// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.


//For toggling the update user password
function Update() {
    var update = document.getElementById("Update");
    var warning = document.getElementById("Warning");

    if (update.style.display == "none") {
        update.style.display = "inline-block";
        warning.style.display = "none";
    } else {
        update.style.display = "none";
    }
}

//For toggling the remove confirm
function Delete() {
    var warning = document.getElementById("Warning");
    var update = document.getElementById("Update");
    if (warning.style.display == "none") {
        warning.style.display = "inline-block";
        update.style.display = "none";
    } else {
        warning.style.display = "none";
    }
}

//For toggling the update user role
function ChangeRole() {
    var role = document.getElementById("Roles");

    if (role.style.display === "none") {
        role.style.display = "inline-block";
    } else {
        role.style.display = "none";
    }
}


function dropDown() {
    document.getElementById("myDropdown").classList.toggle("show");
}

window.onclick = function (event) {
    if (!event.target.matches('.dropBtn')) {
        var dropdowns = document.getElementsByClassName("dropdown-item");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
}



