function InitialNestedForm (container_id, button_id, count) {
  var container_id_selector = '#' + container_id;
  var button_id_selector = '#' + button_id;
  if ($(container_id_selector)) {
    var i = $(container_id_selector + " .fields").length;
    while(i < count){
      $(button_id_selector).click();
      i += 1;
    }
  };
}
