$(document).ready(function(){
  if (document.getElementById("token_submit") != null) { //token_submitというidがnullの場合、下記コードを実行しない
    console.log("hoge")   //表示test用

    Payjp.setPublicKey("pk_test_a250f7afa0f040ea76d3811c"); //ここに公開鍵を直書き
    $("#token_submit").on("click",function(e){
      e.preventDefault();
      //↑ここでrailsの処理を止めることでjsの処理を行う
      var card = {
        number: $("#card_number").val(),
        cvc: $("#card_cvc").val(),
        exp_month: $("#card_exp_month").val(),
        exp_year: $("#card_exp_year").val()
      };
      console.log(card)
      //↑Pay.jpに登録するデータを準備する
      Payjp.createToken(card,function(status,response){
        //↑先ほどのcard情報がトークンという暗号化したものとして返ってくる
        if(status == 200){//←うまくいった場合200になるので
          $("#card_number").removeAttr("name");
          $("#card_cvc").removeAttr("name");
          $("#card_exp_month").removeAttr("name");
          $("#card_exp_year").removeAttr("name");
          //↑このremoveAttr("name")はデータを保持しないように消している

          var payjphtml = `<input type="hidden" name="payjpToken" value=${response.id}>`
          var form = $('#card_form')
          form.append(payjphtml);
          //↑これはdbにトークンを保存するのでjsで作ったトークンをセットしてる
          form.submit("#token_submit");
            console.log("submit")
          //↑そしてここでsubmit！！これでrailsのアクションにいく！もちろん上でトークンをセットしているのでparamsの中には{payjpToken="トークン"}という情報が入っている
        }else{
          console.log(response)
          alert("カード情報が正しくありません。");
        }
      });
    });
  } else {
    console.log("fuga")
  };
});
