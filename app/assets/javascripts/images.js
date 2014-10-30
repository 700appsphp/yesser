function setPreviewElement (preview_id, uri) {
  document.getElementById(preview_id).src = uri;
}

function PreviewImage(image_field_id, preview_id) {
  var oFReader = new FileReader();
  oFReader.readAsDataURL(document.getElementById(image_field_id).files[0]);

  oFReader.onload = function (oFREvent) {
    setPreviewElement(preview_id, oFREvent.target.result);
  };
};
