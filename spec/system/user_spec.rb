require 'rails_helper'

describe "ユーザ登録のテスト" do
  context '【条件別にグループ化（〇〇の場合）】' do
    before do
      
    end
    it "ユーザの新規登録ができること" do
      visit new_user_path
      fill_in "Name", with: 'junho'
      fill_in "Email", with: 'cclemon3248@naver.com'
      fill_in "Password", with: "djdjdjdj1"
      fill_in "Password confirmation", with: "djdjdjdj1"
      click_button 'Create my account'
      expect(page).to have_content 'cclemon3248@naver.com'
    end
    it "ユーザがログインせずタスク一覧画面に飛ぼうとしたとき、ログイン画面に遷移すること" do
      visit tasks_path
      expect(page).to have_content 'Log in'
    end
  end
end

describe "セッション機能のテスト" do
  context '【条件別にグループ化（〇〇の場合）】' do
    before do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user, email: "ae3248@naver.com")
      visit new_session_path
      fill_in "Email", with: 'cclemon3248@naver.com'
      fill_in "Password", with: "djdjdjdj1"
    end
    it "ログインができること" do
      click_button 'Log in'
    end
    it "自分の詳細画面(マイページ)に飛べること" do
      click_button 'Log in'
      expect(page).to have_content 'cclemon3248@naver.com'
    end
    it "一般ユーザが他人の詳細画面に飛ぶとタスク一覧画面に遷移すること" do
      click_button 'Log in'
      visit user_path(@user2.id)
      expect(page).to have_content 'タスク情報'
    end
    it "ログアウトができること" do
      click_button 'Log in'
      click_on 'Logout'
      expect(page).to have_content 'Log in'
    end
  end
end

describe "管理画面のテスト" do
  context '【条件別にグループ化（〇〇の場合）】' do
    before do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user, email: "ae3248@naver.com", admin: false)
      @user3 = FactoryBot.create(:user, email: "ae3247@naver.com", admin: false)
    end
    it '管理ユーザは管理画面にアクセスできること' do
      visit new_session_path
      fill_in "Email", with: 'cclemon3248@naver.com'
      fill_in "Password", with: "djdjdjdj1"
      click_button 'Log in'
      visit admin_users_path
      expect(page).to have_content '管理画面のユーザー一覧画面だよ！'
    end
    it '一般ユーザは管理画面にアクセスできないこと' do
      visit new_session_path
      fill_in "Email", with: 'ae3248@naver.com'
      fill_in "Password", with: "djdjdjdj1"
      click_button 'Log in'
      visit admin_users_path
      expect(page).to have_content 'タスク情報'
    end
    it '管理ユーザはユーザの新規登録ができること' do
      visit new_session_path
      fill_in "Email", with: 'cclemon3248@naver.com'
      fill_in "Password", with: "djdjdjdj1"
      click_button 'Log in'
      visit admin_users_path
      click_on 'ユーザー作成'
      fill_in "Name", with: 'junhoo'
      fill_in "Email", with: 'cclemon3247@naver.com'
      fill_in "Password", with: "djdjdjdj1"
      fill_in "Password confirmation", with: "djdjdjdj1"
      click_button 'Create my account'
      expect(page).to have_content 'junhoo'
    end
    it '管理ユーザはユーザの詳細画面にアクセスできること' do
      visit new_session_path
      fill_in "Email", with: 'cclemon3248@naver.com'
      fill_in "Password", with: "djdjdjdj1"
      click_button 'Log in'
      visit user_path(@user2.id)
      expect(page).to have_content 'ae3248@naver.com'
    end
    it '管理ユーザはユーザの編集画面からユーザを編集できること' do
      visit new_session_path
      fill_in "Email", with: 'cclemon3248@naver.com'
      fill_in "Password", with: "djdjdjdj1"
      click_button 'Log in'
      visit admin_users_path
      all("tbody tr")[1].click_link "編集"
      fill_in "Name", with: 'pikachu'
      fill_in "Email", with: 'cclemon3247@naver.com'
      fill_in "Password", with: "djdjdjdj1"
      click_button 'aaa'
      expect(page).to have_content 'pikachu'
    end
    it "管理ユーザはユーザの削除をできること" do
      visit new_session_path
      fill_in "Email", with: 'cclemon3248@naver.com'
      fill_in "Password", with: "djdjdjdj1"
      click_button 'Log in'
      visit admin_users_path
      accept_confirm do
        all("tbody tr")[1].click_button "削除"
      end
      expect(page).not_to have_content 'ae3248@naver.com'
    end
  end
end
