
module BaseFriendControllerMobileTestModule
  
  class << self
    def included(base)
      base.class_eval do
        include TestUtil::Base::MobileControllerTest
        fixtures :base_users
        fixtures :base_friends
      end
    end
  end
  
  define_method('test: 自分の友達リストを表示する') do 
    login_as :quentin
    
    post :list
    assert_response :success
    assert_template 'list_mobile'
  end
  
  define_method('test: 指定ユーザの友達リストを表示する') do 
    login_as :quentin
    
    post :list, :id => 2 # base_user_id = 2 の友達リストを表示
    assert_response :success
    assert_template 'list_mobile'
  end
  
  define_method('test: 友達として追加する確認画面を表示') do 
    login_as :quentin
    
    post :add_confirm, :id => 4 # base_user_id = 4 を友達として追加
    assert_response :success
    assert_template 'add_confirm_mobile'
  end
  
  define_method('test: 友達として追加する確認画面を表示しようとするが自分自身を友達として追加しようとしているのでエラー画面へ遷移する') do 
    login_as :quentin
    
    post :add_confirm, :id => 1 # base_user_id = 1 を友達として追加
    assert_response :redirect
    assert_redirected_to :action => 'error'
  end
  
  define_method('test: 友達として追加する') do 
    login_as :quentin
    
    post :add, :id => 4 # base_user_id = 4 を友達として追加
    assert_response :redirect
    assert_redirected_to :action => 'add_done'
    
    base_friend = BaseFriend.find(:first, :conditions => ['base_user_id = 1 and friend_id = 4'])
    assert_not_nil base_friend # 友達関係が存在する
    assert_equal base_friend.status, BaseFriend::STATUS_FRIEND # ステータスは友達
  end
  
  define_method('test: 友達として追加しようとするが、自分自身なのでエラー画面へ遷移する') do 
    login_as :quentin
    
    post :add, :id => 1 # base_user_id = 1 を友達として追加
    assert_response :redirect
    assert_redirected_to :action => 'error'
    
    base_friend = BaseFriend.find(:first, :conditions => ['base_user_id = 1 and friend_id = 1'])
    assert_nil base_friend # 友達関係が存在しない
  end
  
  
  define_method('test: 友達として追加しようとするが、既に友達なのでエラー画面へ遷移する') do 
    login_as :quentin
    
    base_friend = BaseFriend.find(:first, :conditions => ['base_user_id = 1 and friend_id = 2'])
    assert_not_nil base_friend # 友達関係が存在する
    
    post :add, :id => 2 # base_user_id = 2 を友達として追加
    assert_response :redirect
    assert_redirected_to :action => 'error'
    
  end
  
  define_method('test: 友達を削除する確認画面を表示する') do 
    login_as :quentin
    
    post :delete_confirm, :id => 2 # base_user_id = 2 を友達から削除
    assert_response :success
    assert_template 'delete_confirm_mobile'
  end
  
  define_method('test: 友達ではない友達を削除する確認画面を表示するしたためエラー画面へ遷移') do 
    login_as :quentin
    
    post :delete_confirm, :id => 9 # base_user_id = 9 を友達から削除
    assert_response :redirect
    assert_redirected_to :action => 'error'
  end
  
  define_method('test: 友達の削除処理を実行する') do 
    login_as :quentin
    
    # 事前確認：友達関係はある
    base_friend = BaseFriend.find(:first, :conditions => ['base_user_id = 1 and friend_id = 2'])
    assert_not_nil base_friend 
    
    post :delete, :id => 1 # base_friend id = 1 の友達関係を削除
    assert_response :redirect
    assert_redirected_to :action => 'delete_done'
    
    after_base_friend = BaseFriend.find(:first, :conditions => ['base_user_id = 1 and friend_id = 2'])
    assert_nil after_base_friend # 友達関係が存在しなくなっている
  end
  
  define_method('test: 友達の削除処理をキャンセルする') do 
    login_as :quentin
    
    # 事前確認：友達関係はある
    base_friend = BaseFriend.find(:first, :conditions => ['base_user_id = 1 and friend_id = 2'])
    assert_not_nil base_friend 
    
    post :delete, :id => 1, :cancel => 'true' # base_friend id = 1 の友達関係を削除
    assert_response :redirect
    assert_redirected_to :action => 'list'
    
    after_base_friend = BaseFriend.find(:first, :conditions => ['base_user_id = 1 and friend_id = 2'])
    assert_not_nil after_base_friend # 友達関係は存在したまま
  end
  
  define_method('test: 友達の削除処理を友達側から実行する') do 
    login_as :aaron
    
    # 事前確認：友達関係はある
    base_friend = BaseFriend.find(:first, :conditions => ['base_user_id = 1 and friend_id = 2'])
    assert_not_nil base_friend 
    
    post :delete, :id => 1 # base_friend id = 1 の友達関係を削除
    assert_response :redirect
    assert_redirected_to :action => 'delete_done'
    
    after_base_friend = BaseFriend.find(:first, :conditions => ['base_user_id = 1 and friend_id = 2'])
    assert_nil after_base_friend # 友達関係が存在しなくなっている
  end
  
  define_method('test: 友達の削除処理を実行しようとするが、関係のないユーザなので削除できずエラー画面へ遷移する') do 
    login_as :three
    
    post :delete, :id => 1 # base_friend id = 1 の友達関係を削除
    assert_response :redirect
    assert_redirected_to :action => 'error'
    
    after_base_friend = BaseFriend.find(:first, :conditions => ['base_user_id = 1 and friend_id = 2'])
    assert_not_nil after_base_friend # エラーなので削除できず友達関係が存在している
  end
  
end