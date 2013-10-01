# -*- coding: utf-8 -*-
require 'spec_helper'

describe 'top page' do

  context 'ログインしていない場合' do
    before do
      visit root_path
    end

    it 'ログイン画面("/sign_in")にリダイレクトされていること' do
      expect(page.current_path).to eq '/sign_in'
#      expect(page.status_code).to eq '200'
    end

    it "メッセージが表示されること" do
      expect(page).to have_css('p', text: 'You need to sign in or sign up before continuing.')
    end
  end

  context 'ログインしている場合' do
    before do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit root_path
    end

    it 'トップページ("/")が表示されていること' do
      expect(page.status_code).to eq 200
      expect(page.current_path).to eq("/")
      expect(page).to have_title("top page")
    end

    it "Hello world!が表示されること" do
      expect(page).to have_css('p', text: 'Hello World!')
    end

  end
end
