function listentEvent() {
  listentInputPlace();
  listenModal();
  const urlParams = new URLSearchParams(window.location.search);
  const myParam = urlParams.get('place');
  const daterange = urlParams.get('daterange');
  const people =  urlParams.get('peopple');
  if(myParam) document.getElementById("input-place").value = myParam;
  if(daterange) document.getElementById("daterange").value = daterange;
}
function listentInputPlace() {
  const locations = document.getElementsByClassName("item-cities");
  for (dow = 0; dow < locations.length; dow++) {
    locations[dow].addEventListener("click", (e) => {
      document.getElementById("input-place").value = e.target.innerText.trim();
    })
  }
}
function listentInputTime(e) {
  const ranges = e.value.split("-");
  const start = new Date(ranges[0].trim());
  const end = new Date(ranges[1].trim());
  console.log((end - start) / 86400000);
  document.getElementById("number-date").innerText = (end - start) / 86400000;

}
function editNumber(element, type) {
  // element : room persion child
  // type: minus plus
  const changeQuality = (quality, equalZero) => {
    if (type == "minus" && (equalZero ? +quality.innerText > 0 : +quality.innerText != 1)) {
      quality.innerText = (+quality.innerText) - 1;
    }
    if (type == "plus") {
      if (equalZero) {
        quality.innerText = (+quality.innerText) + 2;
      } else {
        quality.innerText = (+quality.innerText) + 1;
      }
    }
  }
  var quality = document.getElementById(`quality-${element}`);
  const equalZero = element == "child" ? true : false;
  changeQuality(quality, equalZero);
  document.getElementById("input-people").value = `${document.getElementById('quality-room').innerText} Phòng, ${document.getElementById('quality-person').innerText} người lớn, ${document.getElementById('quality-child').innerText} trẻ em`;

}
function listenModal() {
  // Get the modal
  var modal = document.getElementById("myModal");

  // Get the button that opens the modal
  var btn = document.getElementById("btn-signIn");

  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("close")[0];

  // When the user clicks the button, open the modal 
  btn.onclick = function () {
    modal.style.display = "flex";
  }

  // When the user clicks on <span> (x), close the modal
  span.onclick = function () {
    modal.style.display = "none";
  }

  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function (event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
}
/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft = "0";
}
$(function () {
  $('input[name="daterange"]').daterangepicker(
    {
      opens: "center",
      startDate: moment().startOf("hour"),
      endDate: moment().startOf("hour").add(32, "hour"),
      locale: {},
      language: "vi-VN",
    },
    function (start, end, label) {
      console.log(
        "A new date selection was made: " +
        start.format("YYYY-MM-DD") +
        " to " +
        end.format("YYYY-MM-DD")
      );
    }
  );
});
function onScrollPage(e) {
  const walls = document.getElementsByClassName("wallpaper-header")[0];
  if (window.scrollY > 300) {
    if (!walls.classList.contains("wall-active")) {
      walls.classList.add("wall-active");
    }
  } else {
    if (walls.classList.contains("wall-active")) {
      walls.classList.remove("wall-active");
    }
  }
}
function openDropdownAccount() {
  const dropdown = document.getElementById("dropdown-account");
  if (dropdown) {
    dropdown.classList.toggle("active");
  }
}

