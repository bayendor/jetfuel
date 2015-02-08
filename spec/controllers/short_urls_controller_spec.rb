require "rails_helper"

RSpec.describe ShortUrlsController, type: :controller do
  let(:valid_attributes) do
    { original_url: "www.example.com" }
  end

  let(:invalid_attributes) do
    { original_url: "" }
  end

  let(:valid_session) { {} }

  describe "GET #show" do
    it "assigns the requested short_url as @short_url" do
      short_url = ShortUrl.create! valid_attributes
      get :show, { id: short_url.to_param }, valid_session
      expect(assigns(:short_url)).to eq(short_url)
    end
  end

  describe "GET #new" do
    it "assigns a new short_url as @short_url" do
      get :new, {}, valid_session
      expect(assigns(:short_url)).to be_a_new(ShortUrl)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ShortUrl" do
        expect do
          post :create, { short_url: valid_attributes }, valid_session
        end.to change(ShortUrl, :count).by(1)
      end

      it "assigns a newly created short_url as @short_url" do
        post :create, { short_url: valid_attributes }, valid_session
        expect(assigns(:short_url)).to be_a(ShortUrl)
        expect(assigns(:short_url)).to be_persisted
      end

      xit "redirects to the created short_url" do
        post :create, { short_url: valid_attributes }, valid_session
        expect(response).to redirect_to(ShortUrl.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved short_url as @short_url" do
        post :create, { short_url: invalid_attributes }, valid_session
        expect(assigns(:short_url)).to be_a_new(ShortUrl)
      end

      it "re-renders the 'new' template" do
        post :create, { short_url: invalid_attributes }, valid_session
        expect(response).to render_template("new")
      end
    end
  end
end
