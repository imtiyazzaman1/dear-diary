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
    p @entry = entry[0]
    erb :view_entry
  end
end
