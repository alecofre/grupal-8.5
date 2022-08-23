Rails.application.routes.draw do
  root 'nicenews#index'
  get 'nicenews/new', to: 'nicenews#new', as: :nueva_noticia
  post 'nicenews/create', to: 'nicenews#create', as: :create
  get '/nicenews', to: 'nicenews#index'
  get 'nicenews/deportes', to: 'nicenews#deportes'
  get 'nicenews/farandula', to: 'nicenews#farandula'
  get 'nicenews/nacional', to: 'nicenews#nacional'
  get 'nicenews/internacional', to: 'nicenews#internacional'
  get 'nicenews/politica', to: 'nicenews#politica'
  get 'nicenews/noticias', to: 'nicenews#noticias'
  get 'nicenews/:id', to: 'nicenews#show', as: :noticia
  
  end
  