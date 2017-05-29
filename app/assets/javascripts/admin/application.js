// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require tether
//= require bootstrap
//= require turbolinks
//= require nprogress
//= require nprogress-turbolinks
//= require jquery_nested_form
//= require moment.locales
//= require draggabilly.pkgd.min
//= require mdDateTimePicker
//= require tus
//= require clipboard-toastr

//= require js/flot/jquery.flot
//= require js/flot/jquery.flot.pie
//= require js/flot/jquery.flot.orderBars
//= require js/flot/jquery.flot.time.min
//= require js/flot/date.js
//= require js/flot/jquery.flot.spline.js
//= require js/flot/jquery.flot.stack.js
//= require js/flot/curvedLines.js
//= require js/flot/jquery.flot.resize.js

//= require js/progressbar/bootstrap-progressbar.min.js

//= require js/icheck/icheck.min.js

// require js/moment/moment.min.js
//= require js/datepicker/daterangepicker.js

//= require js/chartjs/chart.min.js

//= require  js/nprogress.js

//= require js/skycons/skycons.min
//= require js/gauge/gauge.min
//= require js/bootstrap-progressbar/bootstrap-progressbar

//= require js/jqvmap/jquery.vmap
//= require js/jqvmap/maps/jquery.vmap.world

//= require js/custom

$(document).on("submit", "form[method=get]", function(e) {
  Turbolinks.visit(this.action + (this.action.indexOf('?') === -1 ? '?' : '&') + $(this).serialize());
  return false;
});

jQuery(function() {
 $("input[type=file]#washing_picture").on("change", function(e) {
    var file = e.target.files[0];
    var fileField = $(e.target)

    fileField.val("");

    var upload = new tus.Upload(file, {
      /*endpoint: "http://localhost:9292/files", */
      endpoint: "http://f2768a64.ngrok.io/files",
      metadata: {filename: file.name, content_type: file.type},
      onError: function(error) {
        alert(error);
      },
      onProgress: function(bytesSent, bytesTotal) {
        var progress = parseInt(bytesSent / bytesTotal * 100, 10);
        var percentage = progress.toString() + '%';
        progressBar.find(".progress-bar").css("width", percentage).html(percentage);
      },
      onSuccess: function(result) {
        progressBar.remove();

        var file = {
          storage: "cache",
          id: upload.url,
          metadata: {
            filename:  upload.file.name.match(/[^\/\\]+$/)[0], // IE returns full path
            size:      upload.file.size,
            mime_type: upload.file.type,
          }
        }

        fileField.prev().val(JSON.stringify(file));
        fileField.after($('<p> <img src="' + upload.url + '"></img></p>'));
      }
    });

    var progressBar = $('<div class="progress" style="width: 300px"><div class="progress-bar"></div></div>').insertBefore(e.target);

    upload.start();
})
});
