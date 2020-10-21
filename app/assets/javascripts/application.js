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
//= require activestorage
//= require turbolinks
//= require jquery
//= require_tree .

//画像のプレビュー機能
	$('#myfile').on('change', function (e) {
		console.log("test")   //表示test用
		var file = e.target.files[0];
	    var reader = new FileReader();
	    reader.onload = function (e) {
	        $("#img1").attr('src', e.target.result);
	    }
	    reader.readAsDataURL(e.target.files[file]);
	});

	$(function () {
		$('#myfile').change(function (e) {
			//ファイルオブジェクトを取得する
			var file = e.target.files[0];
			var reader = new FileReader();

			//アップロードした画像を設定する
			reader.onload = (function (file) {
				return function (e) {
					$("#img1").attr("src", e.target.result);
					$("#img1").attr("title", file.name);
				};
			})(file);
			reader.readAsDataURL(file);
		});
	});

//ハンバーガーメニュー
	$(function() {
	  $('.menu-trigger').on('click', function(event) {
	    $(this).toggleClass('active');
	    $('#sp-menu').fadeToggle();
	    event.preventDefault();
	  });
	});

//ページの一番上へ戻る
	$(function() {
	  $('#back a').on('click',function(event){
	    $('body, html').animate({
	      scrollTop:0
	    }, 800);
	    event.preventDefault();
	  });
	});
