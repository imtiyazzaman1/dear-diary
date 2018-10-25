require './lib/diary_entry'
require 'sinatra/base'

class Diary < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/diary' do
    @entries = DiaryEntry.all
    erb :diary_entries
  end

  get '/view_entry' do
    p params[:id]
    entries = DiaryEntry.all
    @entry = entries.select { |entry|
      entry.id == params[:id]
    }.reduce
    erb :view_entry
  end

  get '/add_entry' do
    erb :write_entry
  end

  get '/update_entry' do
    p params
    @entry = DiaryEntry.all.select { |entry|
      entry.id == params[:id]
    }.reduce
    p @entry
    erb :update_entry
  end

  post '/save_entry' do
    DiaryEntry.update(params[:id], params[:title], params[:body]) if params[:id] != nil
    DiaryEntry.create(params[:title], params[:body]) if params[:id] == nil
    redirect to '/diary'
  end

  post '/delete_entry' do
    DiaryEntry.delete(params[:id])
    redirect to '/diary'
  end
end
