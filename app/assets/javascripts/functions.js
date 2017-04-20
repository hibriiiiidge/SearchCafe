/*
 * [+写真を追加]のイベントトリガー
 * @param selector インプットファイル
 * @param image_file
 */
function image_event(selector, image_file){
  $(selector).change(function(){
      $(image_file).val($(selector).val());
  });
  $(image_file).click(function(){
      $(selector).click();
  });
}

/*
 * @param selector ショップメインイメージ
 */
function form_image_event(selector){
  $(selector).change(function() {
    var file = $(this).prop('files')[0];
    // 画像以外は処理を停止
    if (! file.type.match('image.*')) {
      // クリア
      $(this).val('');
      $('.select_image').html('');
      return;
    }
    // 画像表示
    var reader = new FileReader();
    reader.onload = function() {
      var img_src = $('<img>').attr('src', reader.result);
      $('.select_image').html(img_src);
    }
    reader.readAsDataURL(file);
  });
}

/*
 * ショップイメージアップロード
 * @param selector    インプットファイル
 * @param shopstamp   [+写真を追加]アイコン
 * @param removestamp 削除ボタンアイコン
 * @param removecheck 削除ボタン
 */
function shopfile_image_event(selector, shopstamp, removestamp, removecheck){
  $(selector).change(function() {
    var file_shop = $(this).prop('files')[0];
    var reader_shop = new FileReader();
    reader_shop.onload = function(){
      var img_shop_src = $('<img>').attr('src', reader_shop.result);
      $(shopstamp).html(img_shop_src);
      $(removestamp).show();
      var current_time = new Date();
      var tmp_time =  current_time.getFullYear().toString() +
                      current_time.getMonth().toString() +
                      current_time.getDate().toString() +
                      current_time.getHours().toString() +
                      current_time.getMinutes().toString() +
                      current_time.getMilliseconds().toString();
      $('[data-role="shopimages_area"]').append(
        "<div class=\"shopimage shopthumb_" + tmp_time +
        "\" ><input id=\"shopfile_" + tmp_time +
        "\" type=\"file\" name=\"shop[shopimages_attributes][" + tmp_time +
        "][image]\" class=\"input_file\" ><input name=\"shop[shopimages_attributes][" + tmp_time +
        "][remove_image]\" type=\"hidden\" value=\"0\"><input class=\"remove_check_" + tmp_time +
        "\" type=\"checkbox\" value=\"1\" name=\"shop[shopimages_attributes][" + tmp_time +
        "][remove_image]\" style=\"display:none\"><label class=\"hidden_file\"><span class=\"shopimage_" + tmp_time +
        " shopimage_thumb\" style=\"width:128px\"><i class=\"fa fa-picture-o fa-4x\"></i><p>+写真を追加</p></span><input type=\"text\" class=\"input_text_file\"></label><input type=\"button\" value=\"&#xf1f8;\" class=\"remove_btn_"+ tmp_time +
        " trash \" name=\"remove\" style=\"display:none\"></div><script> selector = \"#shopfile_" + tmp_time +
        "\"; shopstamp = \".shopimage_" + tmp_time +
        "\"; removestamp = \".remove_btn_" + tmp_time +
        "\"; removecheck=\".remove_check_" + tmp_time +
        "\";image_file=\".input_text_file\"; shopthumb=\".shopthumb_" + tmp_time +
        "\"; shopfile_image_event(selector, shopstamp, removestamp, removecheck); remove_btn(selector, shopstamp, removestamp, removecheck, shopthumb); image_event(selector, image_file);</script>"
        );
      $(selector).hide();
    }
    reader_shop.readAsDataURL(file_shop);
  });
}


/*
 * メニューイメージアップロード
 * @param selector    インプットファイル
 * @param menustamp   [+写真を追加]アイコン
 * @param removestamp 削除ボタンアイコン
 * @param removecheck 削除ボタン
 */
function menufile_image_event(selector, menustamp, removestamp, removecheck){
  $(selector).change(function() {
    var file_shop = $(this).prop('files')[0];
    var reader_shop = new FileReader();
    reader_shop.onload = function(){
      var img_shop_src = $('<img>').attr('src', reader_shop.result);
      $(menustamp).html(img_shop_src);
      $(removestamp).show();
      var current_time = new Date();
      var tmp_time =  current_time.getFullYear().toString() +
                      current_time.getMonth().toString() +
                      current_time.getDate().toString() +
                      current_time.getHours().toString() +
                      current_time.getMinutes().toString() +
                      current_time.getMilliseconds().toString();
      $('[data-role="menuimages_area"]').append(
        "<div class=\"menuimage menuthumb_" + tmp_time +
        "\" ><input id=\"menufile_" + tmp_time +
        "\" type=\"file\" name=\"shop[menuimages_attributes][" + tmp_time +
        "][image]\" class=\"input_file_menu\" ><input name=\"shop[menuimages_attributes][" + tmp_time +
        "][remove_image]\" type=\"hidden\" value=\"0\"><input class=\"remove_check_menu_" + tmp_time +
        "\" type=\"checkbox\" value=\"1\" name=\"shop[menuimages_attributes][" + tmp_time +
        "][remove_image]\" style=\"display:none\"><label class=\"hidden_file\"><span class=\"menuimage_" + tmp_time +
        " menuimage_thumb\" style=\"width:128px\"><i class=\"fa fa-picture-o fa-4x\"></i><p>+写真を追加</p></span><input type=\"text\" class=\"input_text_file_menu\"></label><input type=\"button\" value=\"&#xf1f8;\" class=\"remove_btn_"+ tmp_time +
        " trash \" name=\"remove\" style=\"display:none\"></div><script> selector = \"#menufile_" + tmp_time +
        "\"; menustamp = \".menuimage_" + tmp_time +
        "\"; removestamp = \".remove_btn_" + tmp_time +
        "\"; removecheck=\".remove_check_" + tmp_time +
        "\";image_file=\".input_text_file_menu\"; menuthumb=\".menuthumb_" + tmp_time +
        "\"; menufile_image_event(selector, menustamp, removestamp, removecheck); remove_btn(selector, menustamp, removestamp, removecheck, menuthumb); image_event(selector, image_file);</script>"
        );
      $(selector).hide();
    }
    reader_shop.readAsDataURL(file_shop);
  });
}

/*
 * 削除ボタンイベント
 * @param selector    インプットファイル
 * @param shopstamp   [+写真を追加]アイコン
 * @param removestamp 削除ボタンアイコン
 * @param removecheck 削除ボタン
 * @param shopthumb   サムネイル（イメージ全体）
 */
function remove_btn(selector, shopstamp, removestamp, removecheck, thumb){
  $(removestamp).click(function(){
    $(selector).remove();
    $(shopstamp).remove();
    $(removestamp).remove();
    $(thumb).remove();
    $(removecheck).prop("checked", true);
    $(removecheck).hide();
  });
}
