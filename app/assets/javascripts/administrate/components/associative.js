$(function() {
  $('.field-unit--belongs-to select:not(.selectize-initialized)').addClass('selectize-initialized').selectize({});
  $(".field-unit--has-many select:not(.selectize-initialized)").addClass('selectize-initialized').selectize({});
  $('.field-unit--polymorphic select:not(.selectize-initialized)').addClass('selectize-initialized').selectize({});
});
