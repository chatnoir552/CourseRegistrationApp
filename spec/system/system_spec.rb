describe 'system', type: :system, js: true do

    describe '権限のないURLにアクセス(ログイン前)' do

      context '時間割に移動' do

         before do
            visit '/tasks'
         end

         it 'ログインしていないのでエラー' do
            expect(page).to have_content 'ログインもしくはサインアップが必要です'
         end
      end

      context 'ブックマークに移動' do

         before do
            visit '/bookmarks'
         end

         it 'ログインしていないのでエラー' do
            expect(page).to have_content 'ログインもしくはサインアップが必要です'
         end
      end

      context 'ブックマーク登録に移動' do

         before do
            visit '/bookmarks/new'
         end

         it 'ログインしていないのでエラー' do
            expect(page).to have_content 'ログインもしくはサインアップが必要です'
         end

      end

      context '設定に移動' do

         before do
            visit '/setting'
         end

         it 'ログインしていないのでエラー' do
            expect(page).to have_content 'ログインもしくはサインアップが必要です'
         end

      end


    end

    describe '新規登録する' do

      before do
         visit '/users'
      end

       context '新規登録が成功する時' do

         before do
            select '1', from: 'これから受講登録する学年は？'
            select '春セメスター', from: '受講するセメスターは？'
            fill_in '名前は？(ログイン時必須)', with: 'name'
            fill_in 'パスワードは？', with: 'password'
            click_button '登録'
         end

         it '正常に新規登録されページ遷移' do
            expect(page).to have_content '卒業に必要な単位を教えてください'
         end
       end

       context '新規登録が失敗する時(学年だけ空白)' do

         before do
            select '春セメスター', from: '受講するセメスターは？'
            fill_in '名前は？(ログイン時必須)', with: 'name'
            fill_in 'パスワードは？', with: 'password'
            click_button '登録'
         end

         it '学年未登録のエラー' do
            expect(page).to have_content '受講登録する学年を入力してください'
         end
       end

       context '新規登録が失敗する時(セメスターだけ空白)' do

         before do
            select '1', from: 'これから受講登録する学年は？'
            fill_in '名前は？(ログイン時必須)', with: 'name'
            fill_in 'パスワードは？', with: 'password'
            click_button '登録'
         end

         it 'セメスター未登録のエラー' do
            expect(page).to have_content '受講するセメスターを入力してください'
         end
       end

       context '新規登録が失敗する時(名前だけ空白)' do

         before do
            select '1', from: 'これから受講登録する学年は？'
            select '春セメスター', from: '受講するセメスターは？'
            fill_in 'パスワードは？', with: 'password'
            click_button '登録'
         end

         it '名前未登録のエラー' do
            expect(page).to have_content '名前を入力してください'
         end
       end

       context '新規登録が失敗する時(パスワードだけ空白)' do

         before do
            select '1', from: 'これから受講登録する学年は？'
            select '春セメスター', from: '受講するセメスターは？'
            fill_in '名前は？(ログイン時必須)', with: 'name'
            click_button '登録'
         end

         it 'パスワード未登録のエラー' do
            expect(page).to have_content 'パスワードを入力してください'
         end
       end

       context 'データベースに存在する名前を入力した時' do

         before do
           FactoryBot.create(:user, name: 'name')
           select '1', from: 'これから受講登録する学年は？'
           select '春セメスター', from: '受講するセメスターは？'
           fill_in '名前は？(ログイン時必須)', with: 'name'
           fill_in 'パスワードは？', with: 'password'
           click_button '登録'
         end

         it '名前の重複がある場合のエラー' do
            expect(page).to have_content '名前はすでに存在します'
         end
       end
    end

    describe 'ログインする' do

      before do
         user_a = FactoryBot.create(:user, name: 'name_a')
         visit '/login'
      end

      context 'ログイン成功' do

         before do
           fill_in '名前', with: 'name_a'
           fill_in 'パスワード', with: 'password'
           click_button 'ログイン'
         end

         it 'ログイン成功しページ遷移' do
            expect(page).to have_content 'ログインしました'
         end
      end

      context 'ログイン失敗' do

         before do
            fill_in '名前', with: 'name_b'
            fill_in 'パスワード', with: 'password'
            click_button 'ログイン'
         end

         it 'ログイン失敗しエラー' do
            expect(page).to have_content 'ログインに失敗しました'
         end
      end
    end

    describe 'ログイン後にやれること' do

      before do
         user_a = FactoryBot.create(:user, name: 'name_a')
         visit '/login'
         fill_in '名前', with: 'name_a'
         fill_in 'パスワード', with: 'password'
         click_button 'ログイン'
      end

      describe '他のユーザーの作成したブックマークが表示されないことの確認' do

         before do
            user_b = FactoryBot.create(:user, name: 'name_b')
            FactoryBot.create(:bookmark, user: user_b)
            click_link 'ブックマーク'
         end

         it 'ユーザBのブックマークは表示されない' do
            expect(page).not_to have_content 'C言語'
         end
      end

      describe '権限のないURLにアクセス(ログイン後)' do

        context '新規登録に移動' do

         before do
            visit '/users'
         end

         it 'ログインしているのでエラー' do
            expect(page).to have_content '現在ログインしています'
         end

        end

        context 'ログインに移動' do

         before do
            visit '/login'
         end

         it 'ログインしているのでエラー' do
            expect(page).to have_content '現在ログインしています'
         end

        end

      end

      describe 'ログアウトボタンを押す' do

         before do
            click_link 'ログアウト'
         end

         it 'ログアウト成功' do
            expect(page).to have_content 'ログアウトしました'
         end
      end

      describe '設定のページへ移動' do

         before do
            click_link '設定'
         end

         context '初期値の確認' do

            it '名前の変更欄が表示されている' do
               expect(page).to have_field '名前の変更', with: 'name_a'
            end

            it '現在の学年が表示されている' do
               expect(page).to have_select('現在の学年', selected: '1')
            end

            it '現在のセメスターが表示されている' do
               expect(page).to have_select('現在のセメスター', selected: '春セメスター')
            end
         end

         context '設定変更で成功' do

            before do
               fill_in '名前', with: 'name_b'
               select '2', from: '現在の学年'
               select '秋セメスター', from: '現在のセメスター'
               click_button '変更を保存する'
            end

            it '名前が変更された' do
               expect(page).to have_field '名前の変更', with: 'name_b'
            end

            it '現在の学年が変更された' do
               expect(page).to have_select('現在の学年', selected: '2')
            end

            it 'セメスターが変更された' do
               expect(page).to have_select('現在のセメスター', selected: '秋セメスター')
            end

            it 'サクセスメッセージが表示される' do
               expect(page).to have_content 'プロフィールの設定を更新しました'
            end
            
         end

         context '設定変更で失敗(名前を空白に変更)' do

            before do
               fill_in '名前', with: ''
               click_button '変更を保存する'
            end

            it '名前を空白にしたことによりエラー' do
               expect(page).to have_content '名前を入力してください'
            end
         end

         context '設定変更で失敗(存在する名前に変更)' do
            before do
               FactoryBot.create(:user, name: 'name_b')
               fill_in '名前', with: 'name_b'
               click_button '変更を保存する'
            end

            it '名前が重複したことでエラー' do
               expect(page).to have_content '名前はすでに存在します'
            end
         end
      end

      describe 'ブックマーク登録へ移動' do

         before do
           click_link 'ブックマーク登録'
         end

         context 'ブックマーク登録が成功する時' do

            before do
               fill_in '講義名', with: 'Ruby'
               select '月曜日', from: '曜日'
               select '1時限目', from: '時限'
               select '2', from: '単位数'
               click_button '登録する'
            end

            it 'ブックマーク登録が成功' do
               expect(page).to have_content 'ブックマークを登録しました'
            end

            describe 'ブックマークの編集' do

               before do
                  click_link '受講する'
               end

               context '受講する' do
   
                  it '時間割に入れたことをメッセージする' do
                     expect(page).to have_content 'Rubyを時間割に入れました'
                  end

                  it '時間割に表示される' do
                     click_link '時間割'
                     expect(page).to have_content 'Ruby'
                  end

               end

               context '受講取り消し' do

                  before do
                     click_link '受講取り消し'
                  end

                  it '時間割から外したことをメッセージする' do
                     expect(page).to have_content 'Rubyを時間割から除きました'
                  end

                  it '時間割に表示されなくなる' do
                     click_link '時間割'
                     expect(page).to_not have_content 'Ruby'
                  end

               end

               context 'ブックマークの削除を承認' do

                  before do
                     page.accept_confirm do
                        click_link '削除'
                      end
                  end

                  it 'ブックマークから削除される' do
                     expect(page).to_not have_content 'Ruby'
                  end
               end

               context 'ブックマークの削除を拒否' do

                  before do
                     page.dismiss_confirm do
                        click_link '削除'
                      end
                  end

                  it 'ブックマークから削除されない' do
                     expect(page).to have_content 'Ruby'
                  end
               end
            end
         end

         context 'ブックマーク登録時に必須科目にチェック入れる' do

            before do
               fill_in '講義名', with: 'Ruby'
               select '月曜日', from: '曜日'
               select '1時限目', from: '時限'
               select '2', from: '単位数'
               check '必須科目？'
               click_button '登録する'
               click_link '時間割'
            end

            it '必須科目なので時間割に表示されている' do
               expect(page).to have_content 'Ruby'
            end


         end

         context 'ブックマーク登録が失敗する時(講義名が空白)' do

            before do
               select '月曜日', from: '曜日'
               select '1時限目', from: '時限'
               select '2', from: '単位数'
               check '必須科目？'
               click_button '登録する'
            end

            it '講義名未登録のエラー' do
               expect(page).to have_content '講義名を入力してください'
            end
         end

         context 'ブックマーク登録が失敗する時(曜日が空白)' do

            before do
               fill_in '講義名', with: 'Ruby'
               select '1時限目', from: '時限'
               select '2', from: '単位数'
               check '必須科目？'
               click_button '登録する'
            end

            it '曜日未登録のエラー' do
               expect(page).to have_content '曜日を入力してください'
            end
         end

         context 'ブックマーク登録が失敗する時(時限が空白)' do

            before do
               fill_in '講義名', with: 'Ruby'
               select '月曜日', from: '曜日'
               select '2', from: '単位数'
               check '必須科目？'
               click_button '登録する'
            end

            it '時限未登録エラー' do
               expect(page).to have_content '時限を入力してください'
            end
         end

         context 'ブックマーク登録が失敗する時(単位数が空白)' do

            before do
               fill_in '講義名', with: 'Ruby'
               select '月曜日', from: '曜日'
               select '1時限目', from: '時限'
               check '必須科目？'
               click_button '登録する'
            end

            it '単位数未登録エラー' do
               expect(page).to have_content '単位数を入力してください'
            end
         end
         
      end
    end

    
  end