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





//Get submit button
let submitButton = document.querySelector(`#submit`);
let errormessage;
let goodmessage;

function clickListener(event){
    //Create error message
    errormessage = "Refresh the page and fill out all fields";
    goodmessage = "Thank you for filling this out";

   //Get name input and validation
    let nameInput = document.querySelector(`#name`);
    let nameValue = document.querySelector(`#name`).value;

    if(nameValue == ""){
        errormessage += "<br>&nbsp;&nbsp;&middot;Name";
        error = 1;
}
    //Get job input and validation
    let jobInput = document.querySelector(`#job`);
    let jobValue = document.querySelector(`#job`).value;
    if(jobValue == ""){
        
        errormessage += "<br>&nbsp;&nbsp;&middot;Job Title";
        error = 1;
}
    //Get email input and validation
    let emailInput = document.querySelector(`#email`);
    let emailValue = document.querySelector(`#email`).value;

    if(emailValue == "" || !emailValue.includes(`@`)){
        errormessage += "<br>&nbsp;&nbsp;&middot;Email with an @";
        error = 1;
}
if(error ==1){
    document.getElementById(`error`).innerHTML=errormessage;
}else{
    document.getElementById(`good`).innerHTML=goodmessage;
}
}
//Add event listener to listen for a click, then call the function.
submitButton.addEventListener(`click` ,clickListener);   