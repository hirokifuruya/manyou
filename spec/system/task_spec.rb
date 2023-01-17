require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  let!(:task) {FactoryBot.create(:task) }

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task[task_name]', with: 'task1'
        fill_in 'task[task_content]', with:'test'
        fill_in "task[deadline]", with: "2022-02-01"
        select '低', from: 'task_priority'
        select '着手中', from: 'task_status'
        click_on 'commit'
        expect(page).to have_content 'task1'
      end
    end
  end

  describe '検索機能' do
    before do
      # 必要に応じて、テストデータの内容を変更して構わない
      FactoryBot.create(:task, task_name: 'task1', status: '着手中')
      FactoryBot.create(:second_task, task_name: 'task2', status: '完了')
    end

    context 'タイトルであいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        visit tasks_path
        fill_in 'task_name', with: 'task'
        click_on '検索'
        expect(page).to have_content 'task1'
      end
    end
    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        visit tasks_path
        select '着手中', from: 'status'
        sleep(10)
        click_on '検索'
        expect(page).to have_content '着手中'
      end
    end
    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        visit tasks_path
        fill_in 'task_name', with: 'task'
        select '未着手', from: 'status'
        click_on '検索'
        expect(page).to have_content '未着手'
      end
    end
  end
end

