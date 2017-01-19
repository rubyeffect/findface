require 'spec_helper'

describe Findface::Error do
  context '#error_message' do
    before(:all) do
      @message_401 = 'Wrong authentication token or no token at all is provided.'
      @message_403 = "Not authorized. You don't have permission to take action on a particular resource"
      @message_404 = 'Resource was not found'
      @message_422 = 'This usually means you are missing or have supplied invalid parameters for a request: {}'
      @message_500 = "Internal server error. Something went wrong. This is a bug. Please report it to support immediately"
      @message_other = 'An error occured. Please check parsed_response for details'
    end

    it 'must have an error message' do
      response = Findface::Error.error_message(422, {})
      expect(response).not_to be nil
    end

    context '401 code' do
      before(:all) do
        @response = Findface::Error.error_message(401, {})
      end

      it 'must match 401 error message when code is 401' do
        expect(@response).to eq(@message_401)
      end

      it 'must not match other error message when code is 401' do
        expect(@response).not_to eq(@message_other)
      end
    end

    context '403 code' do
      before(:all) do
        @response = Findface::Error.error_message(403, {})
      end

      it 'must match 403 error message when code is 403' do
        expect(@response).to eq(@message_403)
      end

      it 'must not match other error message when code is 403' do
        expect(@response).not_to eq(@message_other)
      end
    end

    context '404 code' do
      before(:all) do
        @response = Findface::Error.error_message(404, {})
      end

      it 'must match 404 error message when code is 404' do
        expect(@response).to eq(@message_404)
      end

      it 'must not match other error message when code is 404' do
        expect(@response).not_to eq(@message_other)
      end
    end

    context '422 code' do
      before(:all) do
        @response = Findface::Error.error_message(422, {})
      end

      it 'must match 422 error message when code is 422' do
        expect(@response).to eq(@message_422)
      end

      it 'must not match other error message when code is 422' do
        expect(@response).not_to eq(@message_other)
      end
    end

    context '500 code' do
      before(:all) do
        @response = Findface::Error.error_message(500, {})
      end

      it 'must match 500 error message when code is 500' do
        expect(@response).to eq(@message_500)
      end

      it 'must not match other error message when code is 500' do
        expect(@response).not_to eq(@message_other)
      end
    end

    it 'must match other error message when code is 123' do
      response = Findface::Error.error_message(123, {})
      expect(response).to eq(@message_other)
    end
  end
end
