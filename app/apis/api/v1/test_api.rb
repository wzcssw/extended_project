module API
  module V1
    class TestApi < Grape::API
      prefix :test

      desc "just test"
      params do
        optional :pp, type: String
      end
      get :list do
        para = params[:pp] || "none"
        arr = ['a','b','c']
        str = "love"

        present :arr, arr
        present :str, str
        present :para, para
      end
      
    end
  end
end
