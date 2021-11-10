function DonateButton(){
    document.getElementById('id01').style.display='block'
    document.getElementsByClassName("now").style
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

function SwitchPage(){
    document.getElementById('id01').style.display='none'
    document.getElementById('id02').style.display='block'
}