require 'rails_helper'
RSpec.describe 'タスクモデル機能', type: :model do
  describe '検索機能' do
    let!(:task) { FactoryBot.create(:task, task_name: 'テスト', status: '着手中') }
    let!(:second_task) { FactoryBot.create(:second_task, task_name: "サンプル", status: '未着手') }
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        expect(Task.get_by_task_name('テスト')).to include(task)
        expect(Task.get_by_task_name('テスト')).not_to include(second_task)
        expect(Task.get_by_task_name('テスト').count).to eq 1
      end
    end
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        expect(Task.get_by_status('着手中')).to include(task)
        expect(Task.get_by_status('着手中')).not_to include(second_task)
        expect(Task.get_by_status('着手中').count).to eq 1
      end
    end
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        expect(Task.get_by_task_name('テスト')).to include(task)
        expect(Task.get_by_status('着手中')).to include(task)
        expect(Task.get_by_task_name('テスト')).not_to include(second_task)
        expect(Task.get_by_status('着手中')).not_to include(second_task)
        expect(Task.get_by_task_name('テスト').count).to eq 1
        expect(Task.get_by_status('着手中').count).to eq 1
      end
    end
  end
end