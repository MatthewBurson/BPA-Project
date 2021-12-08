


  function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
  }
  
  function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
  }








// When the user scrolls down 20px from the top of the document, slide down the navbar
  window.onscroll = function() {scrollFunction()};
      
  function scrollFunction() {
    if (document.body.scrollTop > 1 || document.documentElement.scrollTop > 1) {
      document.getElementById("navbar").style.width = "100%";
      document.getElementById("navbar").style.height = "75px";
      document.getElementById("navbar").style.position = "fixed";
      document.getElementById("navbar").style.margin = "0px";
      document.getElementById("navbar").style.paddingTop = "10px";
      document.getElementById("navbar").style.paddingLeft = "10px";
      document.getElementById("navbar").style.paddingRight = "10px";
      document.getElementById("navbar").style.borderRadius = "0px";

      document.getElementById("navbarmobile").style.width = "100%";
      document.getElementById("navbarmobile").style.height = "75px";
      document.getElementById("navbarmobile").style.margin = "0px";
      document.getElementById("navbarmobile").style.paddingTop = "10px";
      document.getElementById("navbarmobile").style.paddingLeft = "10px";
      document.getElementById("navbarmobile").style.paddingRight = "10px";
      document.getElementById("navbarmobile").style.borderRadius = "0px";
    } else {
      document.getElementById("navbar").style.width = "99%";
      document.getElementById("navbar").style.height = "53px";
      document.getElementById("navbar").style.margin = "10px";
      document.getElementById("navbar").style.paddingTop = "0px";
      document.getElementById("navbar").style.paddingLeft = "0px";
      document.getElementById("navbar").style.paddingRight = "0px";
      document.getElementById("navbar").style.borderRadius = "10px";

      document.getElementById("navbarmobile").style.width = "95%";
      document.getElementById("navbarmobile").style.height = "53px";
      document.getElementById("navbarmobile").style.margin = "10px";
      document.getElementById("navbarmobile").style.paddingTop = "0px";
      document.getElementById("navbarmobile").style.paddingLeft = "0px";
      document.getElementById("navbarmobile").style.paddingRight = "0px";
      document.getElementById("navbarmobile").style.borderRadius = "10px";
    }
  }


