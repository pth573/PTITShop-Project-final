/**
 *
 */

$(document).ready(function () {
  $(".btn-color").click(function () {
    var val = $(this).text();
    $("#sizes").tagsinput("add", val);
  });
  $(".btn-type").click(function () {
    var val = $(this).text();
    $("#types").tagsinput("add", val);
  });
  $(".btn-category").click(function () {
    var val = $(this).text();
    $("#categories").tagsinput("add", val);
  });
});
