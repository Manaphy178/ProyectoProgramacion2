let moviles = document.querySelectorAll("#Mobilecont");
let desk = document.querySelectorAll("#Desktopcont");
let laptops = document.querySelectorAll("#Laptopcont");
let others = document.querySelectorAll("#Othercont");
let tablet = document.querySelectorAll("#Tabletcont");

const radall = document.querySelector("#all");
const radmov = document.querySelector("#Mobile");
const raddesk = document.querySelector("#Desktop");
const radlaptop = document.querySelector("#Laptop");
const radothers = document.querySelector("#Other");
const radtablet = document.querySelector("#Tablet");

radall.addEventListener("click", () => {
  moviles.forEach((pro) => {
    pro.removeAttribute("style");
  });
  desk.forEach((pro) => {
    pro.removeAttribute("style");
  });
  laptops.forEach((pro) => {
    pro.removeAttribute("style");
  });
  others.forEach((pro) => {
    pro.removeAttribute("style");
  });
  tablet.forEach((pro) => {
    pro.removeAttribute("style");
  });
});

radmov.addEventListener("click", () => {
  moviles.forEach((pro) => {
    pro.removeAttribute("style");
  });
  desk.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
  laptops.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
  others.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
  tablet.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
});
raddesk.addEventListener("click", () => {
  moviles.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
  desk.forEach((pro) => {
    pro.removeAttribute("style");
  });
  laptops.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
  others.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
  tablet.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
});
radlaptop.addEventListener("click", () => {
  moviles.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
  desk.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
  laptops.forEach((pro) => {
    pro.removeAttribute("style");
  });
  others.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
  tablet.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
});
radothers.addEventListener("click", () => {
  moviles.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
  desk.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
  laptops.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
  others.forEach((pro) => {
    pro.removeAttribute("style");
  });
  tablet.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
});
radtablet.addEventListener("click", () => {
  moviles.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
  desk.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
  laptops.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
  others.forEach((pro) => {
    pro.setAttribute("style", "display:none;");
  });
  tablet.forEach((pro) => {
    pro.removeAttribute("style");
  });
});
