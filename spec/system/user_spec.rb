require 'rails_helper'

RSpec.describe 'ユーザー管理機能' , type: :system do

  context '新規登録画面に遷移した場合' do
    it '新規登録ができる' do
      visit new_user_path
      fill_in 'user_name', with: '箱崎'
      fill_in 'user_email', with: 'hako@dive.com'
      fill_in 'user_password', with: '111111'
      fill_in 'user_password_confirmation', with: '111111'
      click_on "Create my account"
      expect(page).to have_content '箱崎'
    end
  end

  context 'ユーザがログインせずタスク一覧画面に飛ぼうとした場合' do
    it 'ログイン画面に遷移する' do
      visit tasks_path
      expect(page).to have_content 'Log in'
    end
  end
  context 'ログインができた場合' do
    it '自分の詳細画面(マイページ)に飛べること' do
      visit new_user_path
      fill_in 'user_name', with: '箱崎'
      fill_in 'user_email', with: 'hako@dive.com'
      fill_in 'user_password', with: '111111'
      fill_in 'user_password_confirmation', with: '111111'
      click_on "Create my account"
      expect(page).to have_content '箱崎のページ'
    end
  end

  before do
    #FactoryBot.create(:user1)
    #FactoryBot.create(:user2)
  end
  describe "セッション機能" do
    let(:user1) { FactoryBot.create(:user1) }
    let(:user2) { FactoryBot.create(:user2) }
    context '一般ユーザが他人の詳細画面に飛んだ場合' do
      it 'タスク一覧画面に遷移する' do
        visit new_session_path
        fill_in 'session_email', with: 'user1@dive.com'
        fill_in 'session_password', with: '222222'
        click_on "Log in"
        visit user_path(3)
        expect(page).to have_content '詳細'
        #expect(current_path).to eq tasks_path
      end
    end

    context 'ログイン後' do
      it 'ログアウトができる' do
      visit new_session_path
      fill_in 'session_email', with: 'user1@dive.com'
      fill_in 'session_password', with: '222222'
      click_on "Log in"
      click_on "Logout"
      expect(page).to have_content 'Log in'
      end
    end


    let(:user) { FactoryBot.create(:user) }
    let(:user1) { FactoryBot.create(:user1) }
    describe "管理画面のテスト" do

      context '管理ユーザが管理画面にアクセスした場合' do
        it '管理画面にアクセスできる' do
        visit new_session_path
        fill_in 'session_email', with: 'admin@dive.com'
        fill_in 'session_password', with: '123456'
        click_on "Log in"
        visit admin_users_path
        expect(page).to have_content '管理者'
        end
      end
      context '一般ユーザが管理画面にアクセスした場合' do
        it '管理画面にアクセスできない' do
        visit new_session_path
        fill_in 'session_email', with: 'user1@dive.com'
        fill_in 'session_password', with: '222222'
        click_on "Log in"
        visit admin_users_path
        expect(page).to have_content 'タスク一覧'
        end
      end
      context 'ユーザー一覧画面で新規登録をクリックした場合' do
        it 'ユーザーの新規登録ができる' do
        visit new_session_path
        fill_in 'session_email', with: 'admin@dive.com'
        fill_in 'session_password', with: '123456'
        click_on "Log in"
        visit admin_users_path
        click_on "新規登録"
        fill_in 'user_name', with: '箱崎'
        fill_in 'user_email', with: 'hako@dive.com'
        fill_in 'user_password', with: '111111'
        fill_in 'user_password_confirmation', with: '111111'
        click_on "登録する"
        expect(page).to have_content '箱崎'
        end
      end

      context '管理ユーザがユーザ一覧画面の詳細をクリックした場合' do
        it 'ユーザーの詳細画面にアクセスできる' do
        visit new_session_path
        fill_in 'session_email', with: 'admin@dive.com'
        fill_in 'session_password', with: '123456'
        click_on "Log in"
        visit admin_users_path
        click_on '詳細', match: :first
        expect(page).to have_content '管理者'
        end
      end
      context '管理ユーザがユーザ一覧画面の編集をクリックした場合' do
        it 'ユーザーの編集画面にアクセスできる' do
        visit new_session_path
        fill_in 'session_email', with: 'admin@dive.com'
        fill_in 'session_password', with: '123456'
        click_on "Log in"
        visit admin_users_path
        page.all('tbody tr')[1].click_on '編集'
        fill_in 'user_name', with: 'neko'
        fill_in 'user_password', with: '654321'
        fill_in 'user_password_confirmation', with: '654321'
        click_on "更新する"
        expect(page).to have_content 'のページ'
        end
      end
      context '管理ユーザがユーザ一覧画面の削除をクリックした場合' do
        it 'ユーザの削除ができる' do
        visit new_session_path
        fill_in 'session_email', with: 'admin@dive.com'
        fill_in 'session_password', with: '123456'
        click_on "Log in"
        visit admin_users_path
        page.all('tbody tr')[1].click_on '削除'
        expect(page).to have_content '管理者'
        end
      end
    end
  end
end