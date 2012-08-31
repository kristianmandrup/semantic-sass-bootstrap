# Semantic SASS Twitter Bootstrap

This project aims to take the most recent SASS port of Bootstrap and wrap it with mixins where appropriate in order to allow for more semantic elements in the HTML/DOM structure. 

This semantic approach lets the resulting HTML be more content oriented, with the styling encapsulated in the CSS alone where it belongs.

## HAML Example

```haml
#content.container
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

This project will initially be focused on providing SCSS support, but possibly SASS (and perhaps even LESS) in the future. I welcome other developers to assist in this effort or branch off and create LESS or SASS variants, discuss approaches, naming conventions etc.

This project will initially target use in Rails, but the assets in `vendor/assets/stylesheets` can also be extracted and used in non-Rails projects ;)

Here are some usage examples that I imagine could be possible with this solution... 


## With LESS

```less
#search {
  button {
    .btsBtn('small');
  }
}
#content { .btsContainer() }
#topbar { .btsRow(); }
#main_wrapper { 
  .btsRow();

  #menubar{ .btsColumn(3);}
  #content{ .btsColumn(6);}
  #sidebar{ .btsColumn(3);}
}  
```

## With SCSS

```scss
#search {
  button {
    @include btsBtn($size: 'small', $type: 'primary');
  }
}

#content { @include btsContainer(); }
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
    +btsBtn('small')

#content
  +btsContainer
#topbar 
  +btsRow

#main_wrapper
  +btsRow

  #menubar
    +btsColumn(3)
  #content
    +btsColumn(6)
  #sidebar
    +btsColumn(3)
```

## Mixins

Mixins have been defined for the following Bootstrap modules:

* Accordion
* Breadcrumb
* Buttons
* Button group
* Dropdowns
* Grid (*)
* Layouts (*)
* Mixins (*)
* Modal
* Nav
* Navbar

_Please help out by adding mixins for other Bootstrap modules that you would like to use in a more semantic fashion ;)_

### Accordion

* `btsAccordion()`
* `btsAccordion-group()`
* `btsAccordion-heading($toggle: false)`
* `btsAccordion-toggle()`
* `btsAccordion-inner()`

### Buttons

* `btsBtn($type: 'default', $size: 'default', $icon: false, $state: 'default', $hover: false)`

### Button group

* `btsBtn-group($nested: false)`
* `btsBtn-groupBtn($pos: 'default')`
* `btsBtn-groupBtn-size($size: 'default')`
* `btsBtn-group-first($size: 'default')
* `btsBtn-group-toggle()`
* `btsBtn-group-last($size : 'default')
* `btsBtn-group-btnActive()`
* `btsBtn-group-toggleActive($size: 'default')
* `btsBtn-group-toggle($open: false)`
* `btsBtn-group-toggleBtn($type: 'default')`

*Toolbar*

* `btsBtn-toolbar($nested: false)`
* `btsBtn-toolbar-group()`

*Caret*

* `btsBtn-caret($size: 'default', $dropup: false)`
* `btsBtn-caretActive()`

*Vertical*

* `btsBtn-group-vertical()`
* `btsBtn-group-verticalBtn($nested: false)`
* `btsBtn-group-verticalBtn-pos($pos: 'first')`
* `btsBtn-group-verticalBtn-large($pos: 'first')`

### Dropdowns

* btsDropup()
* btsDropdown()
* btsDropdown-toggle($active: false, $state: 'default')
* btsCaret()
* btsDropdown-caret($state: 'default')
* btsDropdown-menu($pull-right: false, $divider: false)
* btsDropdown-menuDivider()
* btsDropdown-menuItem($active: false)
* btsDropdown-open($nested: false)
* btsDropup-menu()
* btsDropup-menuCaret()
* btsTypeahead()

### Grid

* `btsColumn($columns: 1, $offset: 0)`
* `btsRow()`
* `btsColumn-fluid($number)`
* `btsRow-fluid-hide()`
* `btsRow-fluid-right()`

### Layouts

* `btsContainer()`
* `btsContainer-fluid()`

### Mixins

* `btsRow-core()`
* `btsRow-fluid()`
* `btsRow-fluid-column($pos: 'default')`
* `btsRow-fluid-columnSize($size: 1)`

### Nav

* btsNav()
* btsNav-link($hover : false)
* btsNav-pull-right()
* btsNav-header()
* btsNav-item-header()
* btsNav-list()
* btsNav-list-item($header : false)
* btsNav-list-itemActive()
* btsNav-list-icon()
* btsNav-list-divider()

### Navbar

* btsNavbar()
* btsNavbar-container()
* btsNavbar-collapse()
* btsNavbar-brand($active: false)
* btsNavbar-link()
* btsNavbar-text()
* btsNavbar-btn()
* btsNavbar-groupBtn()


_More to follow... Please help out!_

## Install

Not yet released as a gem, so get it directly from this github repo!

In `Gemfile`:

```ruby
gem 'semantic-sass-bootstrap', git: 'git://github.com/kristianmandrup/semantic-sass-bootstrap.git'
```

Bundle!

`$ bundle`

Then add `semantic_bootstrap` to your `application.css` manifest file.

Using Compass:

`@import 'semantic_bootstrap';`

## Usage

A simple SCSS example illustrating use of buttons and buttonGroup mixins.

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
```

## TODO

Needs usage/experimentation in real life apps :P
Add mixins for addidtional _Twitter Bootstrap_ modules where it makes sense!

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

