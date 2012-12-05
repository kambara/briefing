# Briefing

Briefing is a presentation tool that lets you create slides from a text file written in [Markdown](http://daringfireball.net/projects/markdown/).

By executing `briefing` command and specifying a text file,
you can show it as a beautiful slides in your web browser.

## Features

- Easy to describe contents in slides by using Markdown
- Produces beautiful HTML5-based slides powered by [reveal.js](https://github.com/hakimel/reveal.js/)

## Installation

Install Ruby on ahead, then execute:

    $ sudo gem install briefing

## Usage

    $ briefing slides.md

Open http://localhost:4567/ in a web browser.

## Syntax

- Each slide is written in Markdown syntax.
- Slides are separated by 3 or more hyphens (`---`).
- You can customize the appearance and controls of the slides by specifying settings before the first slide. See below.

### Example

    title      : Slide Title Here
    author     : Keisuke Kambara
    theme      : beige
    transition : concave
    controls   : true
    
    ---
    # Slide Title
    ### Keisuke Kambara
    2012-12-12
    
    ---
    ## Second Slide
    Hello!
    
    ---
    ## Third Slide
    - list item1
    - list item2

### Settings

    title        : Slide Title
    author       : Your Name
    theme        : [default|beige|night|serif|simple|sky]
    transition   : [default|cube|page|concave|zoom|linear|none]
    controls     : false
    progress     : true
    history      : true
    keyboard     : true
    overview     : true
    center       : true
    loop         : false
    rtl          : false
    autoSlide    : 0
    mouseWheel   : false
    rollingLinks : false
    style: |
      .reveal img {
        max-height: 80%;
      }
      .reveal h1, .reveal h2, .reveal h3, .reveal h4, .reveal h5, .reveal h6 {
        text-transform: none;
        font-family: sans-serif;
        font-weight: bold;
      }

## Manually Build and Install (For Developers)

    $ git clone ~~~
    $ cd briefing

If you use RVM, create .rvmrc:

    $ rvm --rvmrc --create ruby-1.9.3@briefing

    $ bundle install
    $ rake build
    $ rake install

## License

[MIT license](http://opensource.org/licenses/MIT)
