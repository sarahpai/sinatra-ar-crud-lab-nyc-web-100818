
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :welcome
  end

  #gives all posts
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  #directs to new posting submisson
  get '/posts/new' do
    erb :new
  end

  #show one post
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  #create posts
  post '/posts' do
    @post = Post.create(params[:post])
    # binding.pry
    
    redirect :'/posts'
  end
  
  #editing post
  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id])
    erb :edit
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by(id: params[:id])
    @post.delete
    redirect :"/posts"
  end
  
end #end of app class
