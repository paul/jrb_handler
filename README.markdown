# JRB Templates

JRB Templates makes it easy to write JSON web services in Rails.  Rather than maintaining two views for the collection and the individual resource, or rendering a third via a partial, you only have to write a single `.jrb` view.

## Installation

Either

    $ gem install jrb_template

or add

    gem jrb_template

to your `./Gemfile`


## Examples

Using the new Ruby 1.9 hash format, you can just write something that looks a lot like JSON:

    # app/views/books/book.json.jrb
    {
      href:        book_url(book),
      _type:       "Book",
      title:       book.title
      author_href: author_url(book.author),
      synopsis:    book.summary,
      isbn:        format_isbn(book.isbn),
      created_at:  book.created_at,
      updated_at:  book.updated_at
    }


In Ruby 1.8, you have to use the old hash format, and the order gets jumbled.

Then, in your controller:

    # app/controllers/books_controller.rb

    class BooksController < ApplicationController

      def index
        @books = Book.all

        respond_to do |format|
          format.html
          format.json { render :jrb_collection => @books }
        end
      end

      def show
        @book = Book.find(params[:id])

        respond_to do |format|
          format.html
          format.json { render :jrb => @book }
        end
      end

    end

*Note: I do not recommend using application/json as the mime type extension. Please see [Versioning REST Web Services][].*

Results in the following json:

    # GET /books
    {
      href: "http://example.com/books",
      count: 1,
      items: [
        {
          href: "http://example.com/books/1
          _type: "Book",
          title: "Death From the Skies!",
          author_href: "http://example.com/authors/plait_philip_c",
          synopsis: " These Are the Ways the World Will End...",
          isbn: "978-0670019977",
          created_at: "2010-12-13T18:44:22Z",
          updated_at: "2010-12-13T18:44:22Z"
        }
      ]
    }

    # GET /books/1
    {
      href: "http://example.com/books/1
      _type: "Book",
      title: "Death From the Skies!",
      author_href: "http://example.com/authors/plait_philip_c",
      synopsis: " These Are the Ways the World Will End...",
      isbn: "978-0670019977",
      created_at: "2010-12-13T18:44:22Z",
      updated_at: "2010-12-13T18:44:22Z"
    }






[Versioning REST Web Services]: http://barelyenough.org/blog/2008/05/versioning-rest-web-services/
