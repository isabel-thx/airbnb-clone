// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

//= require jquery
//= require bootstrap-sprockets

//= require moment
//= require bootstrap-datetimepicker

$(document).on('turbolinks:load', function(){

	  $(function () {
                $('#datetimepicker1').datetimepicker({
                  format: 'DD/MM/YYYY'
                });
            });


	    $(function () {
	                $('#datetimepicker2').datetimepicker({
	                  format: 'DD/MM/YYYY',
	                  useCurrent: false 
	                });
	            });


    $(function () {
        // $('#datetimepicker1').datetimepicker();
        // $('#datetimepicker2').datetimepicker({
        	
        //     useCurrent: false //Important! See issue #1075
        // });
        $("#datetimepicker1").on("dp.change", function (e) {
            $('#datetimepicker2').data("DateTimePicker").minDate(e.date);
        });
        $("#datetimepicker2").on("dp.change", function (e) {
            $('#datetimepicker1').data("DateTimePicker").maxDate(e.date);
        });
    });

  });

$(document).on('turbolinks:load', function(){

      $(function () {
                $('#datetimepicker3').datetimepicker({
                  format: 'DD/MM/YYYY'
                });
            });


        $(function () {
                    $('#datetimepicker4').datetimepicker({
                      format: 'DD/MM/YYYY',
                      useCurrent: false 
                    });
                });


    $(function () {
        // $('#datetimepicker1').datetimepicker();
        // $('#datetimepicker2').datetimepicker({
            
        //     useCurrent: false //Important! See issue #1075
        // });
        $("#datetimepicker3").on("dp.change", function (e) {
            $('#datetimepicker4').data("DateTimePicker").minDate(e.date);
        });
        $("#datetimepicker4").on("dp.change", function (e) {
            $('#datetimepicker3').data("DateTimePicker").maxDate(e.date);
        });
    });

  });
