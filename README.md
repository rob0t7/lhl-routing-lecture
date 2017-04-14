# Routes, More Routes, And Nested Routes

Todays class we went super indepth (but not all the way) into how to
configure Rails routing. We discussed how routing configuration is 1
of the most important concepts and we covered the following:

* how routing in rails works
* manually specifying routes
* resource route helpers
* singular resource routes
* namespaced routes
* nested resource routes

## Restfull routing and Rails

Rails really want you to use restful routing. It even provides you
with shortcuts to create routes. Let look at the following:

``` ruby
resources :blog_posts

# create the following
get    '/blog_posts',     to: 'blog_posts#index'
post   '/blog_posts',     to: 'blog_posts#create'
get    '/blog_posts/:id', to: 'blog_posts#show'
put    '/blog_posts/:id', to: 'blog_posts#update'
patch  '/blog_posts/:id', to: 'blog_posts#update'
delete '/blog_posts/:id', to: 'blog_posts#destroy'

# also creates the following "extra" routes
get    '/blog_posts/new'       to: 'blog_posts#new'
get    '/blog_posts/:id/edit', to: 'blog_posts#edit'
```

These routes are usually fine but there are cases where we may not
want to use the default routes that rails provides. These include the
following scenarios:

* for SEO we want better URLs so may have *get '/blog_posts/post-slug'*
* for UX we may not map all our Models to Routes. (example we never
  fetch an InvoiceItem seperately from an Invoice).
* we often rewrite the default url to be more meaningful (ex: /login
  vs /session/new)
* we may create *extra* actions on a resource (ex /invoices/:id/pay &
  /invoices/:id/refund)

It is also good practice to seperate api from server-side rendering
apps this way

``` ruby
#normal routes
# ...
# API routes
namespace :api do
  # ...
end
```

## Plural vs Singular Routes

We also discuessed the difference between plural resource routes and
singular. We use singular routes when the user should only have access
to 1 resource. Examples include *session, profile settings, avatar*

``` ruby
resource :profile

# create the following
get '/profile', to: 'profiles#show'
get '/profile/edit', to: 'profiles#edit'
put '/profile',      to: 'profiles#update'
patch '/profile',    to: 'profiles#update'
delete '/profile',   to: 'profiles#destroy'
```

Notice that the Model (if it is not a virtual resource) and the
controller name would still be plural.

## Nested Resources

Finall we talk and **demoed** a nest resource example. With nested
resources we can use the structure of urls to showcase relationship of
objects.

## Extra Resources

To learn more:

* http://guides.rubyonrails.org/routing.html
* https://github.com/norman/friendly_id
