// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails


import "@hotwired/turbo-rails"
import "controllers"

import jquery from "jquery"
window.$ = jquery


console.log("aaa");
console.log("bbbb");




  document.addEventListener('turbo:load', ()=>{
    const setting = document.querySelector('.header-list-left li:nth-of-type(5)');
    const adjust = document.querySelector('.header-list-left li:nth-of-type(4)');
    const user = document.querySelector('.setting-content');
    const schedule = document.querySelector('.schedule-content');
    
    //user.classList.add('none');
    
    setting.addEventListener('click', function(){
       user.classList.toggle('none');
      });

    adjust.addEventListener('click', function() {
      schedule.classList.toggle('none');
    });  





    let maincreditVal = document.getElementById('bookmark_maincredit_id').value;  


    //このifは登録が失敗し，renderされた場合にサブ科目が表示されるようにするため
     if(maincreditVal !== ""){
      let selectedTemplate = document.getElementById(`sub-category-of-category${maincreditVal}`);
      document.getElementById('subcredit_label').remove();
      document.getElementById('bookmark_subcredit_id').remove();
      document.querySelector('.new_bookmark .subcredit').insertAdjacentHTML('afterbegin', selectedTemplate.innerHTML);
    } 



    let defaultSubCategorySelect = `<select name="bookmark[subcredit_id]" id="bookmark_subcredit_id">
    <option value="">選択して下さい</option></select>`



    ///メイン科目が変更したとき中身があればifの処理
    document.getElementById('bookmark_maincredit_id').addEventListener('change', function(){
      let maincreditVal = document.getElementById('bookmark_maincredit_id').value;

      if(maincreditVal !== ""){
        let selectedTemplate = document.getElementById(`sub-category-of-category${maincreditVal}`);
        document.getElementById('subcredit_label').remove();
        document.getElementById('bookmark_subcredit_id').remove();
        document.querySelector('.new_bookmark .subcredit').insertAdjacentHTML('afterbegin', selectedTemplate.innerHTML);
      }
      else{
        document.getElementById('bookmark_subcredit_id').remove();
        document.getElementById('subcredit_label').insertAdjacentHTML('afterend', defaultSubCategorySelect);
      };
    });  



       
  });


