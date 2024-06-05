window.addEventListener("scroll", function () {
  const header1 = document.getElementById("header1");
  const header2 = document.getElementById("header2");

  if (window.scrollY > 100) {
    header1.style.display = "block";
    header2.style.display = "none";
  } else {
    header1.style.display = "none";
    header2.style.display = "block";
  }
});
