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
    context 'タスクが終了期限の降順に並んでいる場合' do
      it '終了期限が近いものから表示する' do
        task = FactoryBot.create(:task, task_name: 'タイトル1', deadline: "2023-02-02")
        task = FactoryBot.create(:second_task, task_name: 'タイトル2', deadline: "2023-03-03")
        visit tasks_path
        click_on '終了期限'
        sleep(2)
        task_list = all('.task_row')
          expect(task_list[0]).to have_content '名前1'
          expect(task_list[1]).to have_content 'タイトル1'
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
    context '優先順位検索をした場合' do
      it "優先順位が高い順にソートできる" do
        visit tasks_path
        click_link "優先度"
        expect(page).to have_content '高'
      end
    end
  end
end

