$(function () {
  var $gallery = new SimpleLightbox(".gallery a", {});
});

$(document).on("click", "#id_enable_google_photo", function () {
  const isChecked = $(this).is(":checked");
  if (isChecked) {
    $("#id_photo_google_link").show();
  } else {
    $("#id_photo_google_link").hide();
  }
});
