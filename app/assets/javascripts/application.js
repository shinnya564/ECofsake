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

//map 表示
	let map
	let geocoder
	const display = document.getElementById('display')

	function initMap(){
		geocoder = new google.maps.Geocoder()

		map = new google.maps.Map(document.getElementById('map'), {
			center: {lat: 35.6646706, lng: 139.7377352},zoom: 18,
		});

		marker = new google.maps.Marker({
			position:  {lat: 35.6646706, lng: 139.7377352},
			map: map
		});
	}


//top スライドショー
	$(document).on('turbolinks:load', function() {
		// オプションを指定してSkipprの実行
		$(".logo").skippr({
		    // スライドショーの変化（"fade" or "slide"）
		    transition : 'fade',
		    // 変化にかかる時間（ミリ秒）
		    speed : 3000,
		    // easingの種類
		    easing : 'easeOutQuart',
		    // ナビゲーションの形（"block" or "bubble"）
		    navType : 'bubble',
		    // 子要素の種類（"div" or "img"）
		    childrenElementType : 'div',
		    // ナビゲーション矢印の表示（trueで表示）
		    arrows : true,
		    // スライドショーの自動再生（falseで自動再生なし）
		    autoPlay : true,
		    // 自動再生時のスライド切替間隔（ミリ秒）
		    autoPlayDuration : 5000,
		    // キーボードの矢印キーによるスライド送りの設定（trueで有効）
		    keyboardOnAlways : true,
		    // 1枚目のスライド表示時に戻る矢印を表示するかどうか [false]:矢印を隠さない [true]:矢印を隠す
		    hidePrevious : false
		});
	});

//画像のプレビュー機能
	$('#myfile').on('change', function (e) {
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
