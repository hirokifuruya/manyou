require 'rails_helper'

RSpec.describe Label, type: :system do
  let!(:user1) { FactoryBot.create(:user1) }
  let!(:label) { FactoryBot.create(:label) }
  context "タスクを新規登録した場合" do
    it "ラベルも登録できる" do
      visit new_session_path
      fill_in 'session_email', with: 'user1@dive.com'
      fill_in 'session_password', with: '222222'
      click_on "Log in"
      click_on "新たに投稿する。"
      fill_in 'task_task_name', with: 'テスト'
      fill_in 'task_task_content', with: 'テスト'
      fill_in "task_deadline", with: "2023-05-17"
      select '低', from: 'task_priority'
      select '着手中', from: 'task_status'
      check "task_label_ids_#{Label.last.id}"
      click_on "タスク作成"
      expect(page).to have_content 'テスト'
    end
  end
  context "タスクを編集した場合" do
    it "ラベルも編集できる" do
      visit new_session_path
      fill_in 'session_email', with: 'user1@dive.com'
      fill_in 'session_password', with: '222222'
      click_on "Log in"
      click_on "新たに投稿する。"
      fill_in 'task_task_name', with: 'テスト'
      fill_in 'task_task_content', with: 'テスト'
      fill_in "task_deadline", with: "2023-05-17"
      select '低', from: 'task_priority'
      select '着手中', from: 'task_status'
      check "task_label_ids_#{Label.last.id}"
      click_on "タスク作成"
      expect(page).to have_content 'テスト'
    end
  end
  context "タスクの詳細画面に遷移した場合" do
    it "そのタスクに紐づいているラベル一覧を出力する" do
      visit new_session_path
      fill_in 'session_email', with: 'user1@dive.com'
      fill_in 'session_password', with: '222222'
      click_on "Log in"
      click_on "新たに投稿する。"
      fill_in 'task_task_name', with: 'テスト'
      fill_in 'task_task_content', with: 'テスト'
      fill_in "task_deadline", with: "2023-05-17"
      select '低', from: 'task_priority'
      select '着手中', from: 'task_status'
      check "task_label_ids_#{Label.last.id}"
      click_on "タスク作成"
      expect(page).to have_content 'テスト'
    end
  end
  context "タスクにラベルを登録した場合" do
    it "つけたラべルで検索ができる" do
      visit new_session_path
      fill_in 'session_email', with: 'user1@dive.com'
      fill_in 'session_password', with: '222222'
      click_on "Log in"
      click_on "新たに投稿する。"
      fill_in 'task_task_name', with: 'テスト'
      fill_in 'task_task_content', with: 'テスト'
      fill_in "task_deadline", with: "2023-05-17"
      select '低', from: 'task_priority'
      select '着手中', from: 'task_status'
      check "task_label_ids_#{Label.last.id}"
      click_on "タスク作成"
      select 'label_1', from: 'label_id'
      click_on "検索"
      expect(page).to have_content 'テスト'
    end
  end
end