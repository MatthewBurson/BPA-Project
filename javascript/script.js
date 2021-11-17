

// When the user scrolls down 20px from the top of the document, slide down the navbar
  window.onscroll = function() {scrollFunction()};
      
  function scrollFunction() {
    if (document.body.scrollTop > 80 || document.documentElement.scrollTop > 80) {
      document.getElementById("navbar").style.top = "2%";
      document.getElementById("navbar").style.position = "fixed";
    } else {
      document.getElementById("navbar").style.top = "1%";
      document.getElementById("navbar").style.position = "static";
    }
  }

