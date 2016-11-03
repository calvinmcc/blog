require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe '#new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
     end

    it 'instantiates  a new post object' do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe '#create' do
    context 'with valid params' do
    def valid_request
      post :create, params: { post: attributes_for(:post)}
    end
    it 'creates a new post object' do
      before_count = Post.count
      valid_request
      after_count = Post.count
      expect(after_count).to eq(before_count + 1)
    end
    it 'redirects to the show page' do
      valid_request
      expect(response).to redirect_to(post_path(Post.last))
    end
  end
    context 'with invalid_params' do
      def invalid_request
        post :create, params: { post: attributes_for(:post, title: nil)}
      end
      it 'does not create a new post object' do
        before_count = Post.count
        invalid_request
        after_count = Post.count
        expect(after_count).to eq(before_count)
      end
      it 'renders the new template' do
        invalid_request
        expect(response).to render_template(:new)
      end
    end
  end
  describe '#show' do
    it 'renders the show template' do
      post = create(:post)
      get :show, params: { id: post.id }
      expect(response).to render_template(:show)
    end
    it 'sets an instance variable with the post whose id is passed' do
      post = create(:post)
      get :show, params: { id: post.id }
      expect(assigns(:post)).to eq(post)
    end
  end
  describe '#destroy' do
    def valid_request
      post :create, params: { post: attributes_for(:post)}
    end

    it 'deletes a post' do
      post = create(:post)
      count_before = Post.count
      delete :destroy, params: { id: post.id }
      count_after = Post.count
      expect(count_after).to eq(count_before - 1)
    end

    it 'redirects to index' do
      post = create(:post)
      delete :destroy, params: { id: post.id }
      expect(response).to redirect_to(posts_path)
    end

  end
  describe '#index' do
    it 'it renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
  describe '#edit' do
    it 'renders the edit page' do
      post = create(:post)
      get :edit, params: { id: post.id }
      expect(response).to render_template(:edit)
    end
    it 'sets an instance variable with the post whose id is passed' do
      post = create(:post)
      get :edit, params: { id: post.id }
      expect(assigns(:post)).to eq(post)
    end
  end
  describe '#update' do
    it 'updates a post' do
    post = create(:post)
    patch :update, params: { id: post.id, post:
                           {title: 'some title'} }
    expect(post.reload.title).to eq('some title')
  end

    it 'redirects to the show template' do
      post = create(:post)
      patch :update, params: { id: post.id, post:
                             {title: 'some title'} }
      expect(response).to redirect_to(post_path(post))
    end
  end
end
