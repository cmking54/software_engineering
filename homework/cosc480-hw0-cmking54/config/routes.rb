Rails.application.routes.draw do
  get 'ghost/play'
  root to: 'ghost#play' # can be root: ...
end
