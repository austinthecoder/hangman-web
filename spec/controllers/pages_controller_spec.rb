require 'spec_helper'

describe PagesController do
  describe 'GET home' do
    it 'renders the template' do
      get :home
      expect { response }.to render_template('home')
    end
  end
end