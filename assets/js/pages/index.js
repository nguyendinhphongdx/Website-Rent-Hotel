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
    $.datepicker.setDefaults($.datepicker.regional["vi-VN"]);
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
  function onScrollPage(e){
    const walls =  document.getElementsByClassName("wallpaper-header")[0];
    if(window.scrollY>300){
        if(!walls.classList.contains("wall-active")){
            walls.classList.add("wall-active");
        }
    }else{
        if(walls.classList.contains("wall-active")){
            walls.classList.remove("wall-active");
        }
    }
  }