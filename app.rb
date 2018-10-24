require './lib/diary_entry'
require 'sinatra/base'

class Diary < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/diary' do
    @entries = DiaryEntry.all.join(" ")
    erb :diary_entries
  end

end
