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





[Versioning REST Web Services]: http://barelyenough.org/blog/2008/05/versioning-rest-web-services/
