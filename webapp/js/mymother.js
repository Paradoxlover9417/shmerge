let mainText = document.querySelector("h1");

if (mainText) {
  window.addEventListener('scroll', function() {
    let value = window.scrollY;
    console.log("scrollY", value);
    
    if (value > 400) {
      mainText.style.animation = 'disappear 1s ease-out forwards';
    } else {
      mainText.style.animation = 'slide 1s ease-out';
    }
  });
}
