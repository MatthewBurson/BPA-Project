function Donate(){
    document.getElementsByClassName("now")[0].style.width = '5000px';
    document.getElementsByClassName("now")[0].style.transition = '0.2s';
    document.getElementsByClassName("boxtext")[0].style.color = 'green';
    document.getElementsByClassName("boxtext")[0].style.transition = '0.2s';
}

function myFunction() {
    alert("You have donated $5");
}

// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}