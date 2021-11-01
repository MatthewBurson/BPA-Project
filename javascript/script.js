// When the user scrolls the page, execute myFunction
window.onscroll = function() {myFunction()};

// Get the navbar
var navbar = document.getElementById("#navbar");

// Get the offset position of the navbar
var sticky = navbar.offsetTop;

// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}
var modal = document.getElementById('id01');

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

function scrollFunction(){
  document.getElementsByClassName("transbox")[0].style.border = '5px solid green';
  document.getElementsByClassName("transbox")[0].style.transition = '0.2s';
  document.getElementsByClassName("boxtext")[0].style.color = 'green';
  document.getElementsByClassName("boxtext")[0].style.transition = '0.2s';
}
function scrollFunctionOut(){
  document.getElementsByClassName("transbox")[0].style.border = '5px solid black';
  document.getElementsByClassName("transbox")[0].style.transition = '0.2s';
  document.getElementsByClassName("boxtext")[0].style.color = 'black';
  document.getElementsByClassName("boxtext")[0].style.transition = '0.2s';
}