require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CurrenciesController do

  # This should return the minimal set of attributes required to create a valid
  # Currency. As you add validations to Currency, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CurrenciesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all currencies as @currencies" do
      currency = Currency.create! valid_attributes
      get :index, {}, valid_session
      assigns(:currencies).should eq([currency])
    end
  end

  describe "GET show" do
    it "assigns the requested currency as @currency" do
      currency = Currency.create! valid_attributes
      get :show, {:id => currency.to_param}, valid_session
      assigns(:currency).should eq(currency)
    end
  end

  describe "GET new" do
    it "assigns a new currency as @currency" do
      get :new, {}, valid_session
      assigns(:currency).should be_a_new(Currency)
    end
  end

  describe "GET edit" do
    it "assigns the requested currency as @currency" do
      currency = Currency.create! valid_attributes
      get :edit, {:id => currency.to_param}, valid_session
      assigns(:currency).should eq(currency)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Currency" do
        expect {
          post :create, {:currency => valid_attributes}, valid_session
        }.to change(Currency, :count).by(1)
      end

      it "assigns a newly created currency as @currency" do
        post :create, {:currency => valid_attributes}, valid_session
        assigns(:currency).should be_a(Currency)
        assigns(:currency).should be_persisted
      end

      it "redirects to the created currency" do
        post :create, {:currency => valid_attributes}, valid_session
        response.should redirect_to(Currency.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved currency as @currency" do
        # Trigger the behavior that occurs when invalid params are submitted
        Currency.any_instance.stub(:save).and_return(false)
        post :create, {:currency => {  }}, valid_session
        assigns(:currency).should be_a_new(Currency)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Currency.any_instance.stub(:save).and_return(false)
        post :create, {:currency => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested currency" do
        currency = Currency.create! valid_attributes
        # Assuming there are no other currencies in the database, this
        # specifies that the Currency created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Currency.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => currency.to_param, :currency => { "these" => "params" }}, valid_session
      end

      it "assigns the requested currency as @currency" do
        currency = Currency.create! valid_attributes
        put :update, {:id => currency.to_param, :currency => valid_attributes}, valid_session
        assigns(:currency).should eq(currency)
      end

      it "redirects to the currency" do
        currency = Currency.create! valid_attributes
        put :update, {:id => currency.to_param, :currency => valid_attributes}, valid_session
        response.should redirect_to(currency)
      end
    end

    describe "with invalid params" do
      it "assigns the currency as @currency" do
        currency = Currency.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Currency.any_instance.stub(:save).and_return(false)
        put :update, {:id => currency.to_param, :currency => {  }}, valid_session
        assigns(:currency).should eq(currency)
      end

      it "re-renders the 'edit' template" do
        currency = Currency.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Currency.any_instance.stub(:save).and_return(false)
        put :update, {:id => currency.to_param, :currency => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested currency" do
      currency = Currency.create! valid_attributes
      expect {
        delete :destroy, {:id => currency.to_param}, valid_session
      }.to change(Currency, :count).by(-1)
    end

    it "redirects to the currencies list" do
      currency = Currency.create! valid_attributes
      delete :destroy, {:id => currency.to_param}, valid_session
      response.should redirect_to(currencies_url)
    end
  end

end
