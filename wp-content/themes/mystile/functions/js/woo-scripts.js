/**
 *
 * Style Select
 *
 * Replace Select text
 * Dependencies: jQuery
 *
 */
(function ($) {
  styleSelect = {
    init: function () {
      $( '.select_wrapper').each(function () {
        $(this).prepend( '<span>' + $(this).find( '.woo-input option:selected').text() + '</span>' );
      });
      $(document).on( 'change', 'select.woo-input', function () {
        $(this).prev( 'span').replaceWith( '<span>' + $(this).find( 'option:selected').text() + '</span>' );
      });
      $(document).on('click', 'select.woo-input', function(event) {
        $(this).prev( 'span').replaceWith( '<span>' + $(this).find( 'option:selected').text() + '</span>' );
      }); 
    }
  };
})(jQuery);

jQuery(document).ready(function() { 
styleSelect.init();
});
