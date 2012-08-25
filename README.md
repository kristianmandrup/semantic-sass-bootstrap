# Semantic SASS Twitter Bootstrap

This project aims to take the most recent SASS port of Bootstrap and wrap it with mixins where appropriate in order to allow for more semantic elements in the HTML/DOM structure. 

This semantic approach lets the resulting HTML be more content oriented, with the styling encapsulated in the CSS alone where it belongs.

## HAML Example

```haml
#topbar
#main_wrapper
  #menubar.span3
    hello
  #content.span6
    hi
    .actions
      #search
        input{type: 'search'}
        button
          Search
  #sidebar.span3.last
    bye
```

This project will initially be focused on providing SCSS support, but possibly SASS (and perhaps even LESS) in the future. I welcome other developers to assist in this effort or branch off and create LESS or SASS variants and discuss best approaches, naming conventions etc.

This project will initially target use in Rails, but the assets in `vendor/assets/stylesheets` can also be extracted and used in non-Rails projects ;)

Here are some usage examples that I imagine could be possible with this solution... 

I also like an `asColumn`, `asBtn` etc. naming convention. Suggestions are welcome!

PS: The syntax might have errors, since I am still a newbie with these techs.

## With LESS

```less
#search {
  button {
    .makeBtn('small');
  }
}
#topbar { .makeRow(); }
#main_wrapper { 
  .makeRow();

  #menubar{ .makeColumn(3);}
  #content{ .makeColumn(6);}
  #sidebar{ .makeColumn(3);}
}  
```

## With SCSS

The ugly way, by simply using `@extend`

```scss
#search {
  button {
    @extend .btn.btn-primary
  }
}
```

The better way:

```scss
#search {
  button {
    @include btsBtn($size: 'small', $type: 'primary');
  }
}
```

```scss
#topbar { @include makeRow(); }
#main_wrapper { 
  @include makeRow();

  #menubar{ @include makeColumn(3);}
  #content{ @include makeColumn(6);}
  #sidebar{ @include makeColumn(3);}
}  
```

## With SASS

```sass
#search
  button
    +makeBtn('small')
  
#topbar 
  +makeRow

#main_wrapper
  +makeRow

  #menubar
    +makeColumn(3)
  #content
    +makeColumn(6)
  #sidebar
    +makeColumn(3)
```

## Mixins

*Buttons*

* `btsBtn($type: 'default', $size: 'default', $icon: false, $state: 'default', $hover: false)`

*Button group*

* `btsBtn-group($nested: false)`
* `btsBtn-toolbar()`
* `btsBtn-groupBtn($pos: 'default')`
* `btsBtn-groupToggle($size: 'default', $active: false, $open: false)`
* `btsBtn-groupToggleBtn($type: 'default')
* `btsBtn-caret($size: 'default', $hover: false)

*Grid*

* `btsColumn($columns: 1, $offset: 0)`
* `btsRow()`

More to follow... Please help out!

## Usage

Examples to follow here...

```scss

$action-size: 'large';

#search {
  button {
    @include btsBtn($size: 'small');

    &:hover {
      @include btsBtn($hover: true);      
    }
  }

  .actions {
    @include btsBtn-group($size: $action-size);

    + .actions {
      @include btsBtn-group($size: $action-size, $nested: true);      
    }
  }
}

#topbar { 
  @include btsRow(); 
}

#main_wrapper { 
  @include makeRow();

  #menubar{ 
    @include btsColumn(3);
  }
  #content{ 
    @include btsColumn(6);
  }
  #sidebar{ 
    @include btsColumn(3);
  }
}  
```

## TODO

Needs usage/experimentation in real life apps :P

## Contributing to semantic-sass-bootstrap
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 Kristian Mandrup. See LICENSE.txt for
further details.

