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
    entries = DiaryEntry.all
    entry = entries.select { |entry|
      entry.id == params[:id]
    }
    @entry = entry.reduce
    erb :view_entry
  end

  get '/add_entry' do
    erb :write_entry
  end

  post '/save_entry' do
    p params[:title]
    DiaryEntry.create(params[:title], params[:body])
    redirect to '/diary'
  end
end
