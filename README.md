# dm-dragonfly

DataMapper extensions to support the Rack-based file storing/processing library, [Dragonfly](http://markevans.github.com/dragonfly/).

## Synopsis

Require **dm-dragonfly** and create a new Dragonfly app with the desired configuration options. Define a macro for the Dragonfly app using the added Dragonfly::App#define_dm_macro method. Define this on the base module that you're including in all models (likely a custom module you've written or DataMapper::Resource).

    require 'dm-dragonfly'
    
    app = Dragonfly[:attachments]
    app.configure_with(:imagemagick)
    app.configure_with(:rails)
    
    app.define_dm_macro(BaseModel, :attachment_accessor)
