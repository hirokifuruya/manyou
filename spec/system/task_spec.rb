require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  let!(:task) {FactoryBot.create(:task) }

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task[task_name]', with: '先生'
        fill_in 'task[task_content]', with:'test'
        click_on 'commit'
        expect(page).to have_content '先生'
      end
    end
  end
  describe '一覧表示機能' do
    before do
      #あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する
      FactoryBot.create(:task)
      FactoryBot.create(:second_task)
      visit tasks_path
    end
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        expect(page).to have_content '名前1'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        visit tasks_path
        task_list = all('.task_row')
        expect(task_list.first).to have_content '名前2'
      end
    end
  end
  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        visit task_path(task.id)
        expect(page).to have_content '名前1'
      end
    end
  end
end