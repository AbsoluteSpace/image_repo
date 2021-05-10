# Image Repo

My image repository is an online store where users can browse the store owner's images before making a digital purchase. The owner has a range of tools to apply discounts to their products, and I began this task by trying to research what tools might be helpful for a store owner in this position.

With my project I wanted to focus on how it could help **make commerce better for everyone**, and the best way I felt I could represent that was by making the store as accessable as I can. I've done this by:
- adding alt-text to all important images, and [considering whether alt-text conveys valuable information](https://ux.shopify.com/writing-for-all-people-how-to-use-alternative-text-well-1205a18307a1#.izw9gzaa9) for each one as opposed to merely a description of a decorative image.
- Making the site as easy to navigate as possible with descriptive tabs, text suggestions on certain pages to help users who aren't sure how to interact with the site, and large print actions such as "ORDER CONFIRMED" to provide the most important information clearly for as many users as possible.
- A clean style to make things feel approachable and efficient.

These carry over to my design of the admin actions for the store owner as well.

I've populated my store to be a book store representing books that I've enjoyed or want to read. 

## Features

As the store owner:
- Create/Edit/Delete images representing books that you are digitally selling.
- Apply discounts to individual images.
- Apply site-wide discounts based on an image's tags.
- Discounts are either percentage based or amount based.

As a customer:
- Browse images on the site showcasing products being sold.
- Click on images to view their information and make purchases.

## How to Run

- Clone the git repo.
- The application can be run with `bin/rails serve` in the downloaded directory.
- Navigate on your browser to `http://localhost:3000/`

### How to see a lot of the cool features:
 
- Browse the site and make a purchase.
- Login as the store owner in the admin tab with `username: admin@email.com`, `password: admin1`.
- Edit an image on the site with your new admin powers.
- Create a new image on the admin tab.
- Create a new discount on the admin tab, and see when it takes effect!
- View a list of all discounts (both active/inactive) on the admin tab.
- Log out and thank you for visitng!


## Tech

 Created using Ruby on Rails with a SQLite database.

I approached this using test driven development where unit tests were created to validate my models and controllers before writing the code.

### How can this be extended?

Another way I've tried to make commerce better for everyone, is by writing code that another developer can pick up and easily extend so that the site is easy to adapt for future needs.
- I've used MVC and the models are easy to extend as new fields can be added to them.
- I've done my best to refactor my code into things like partials for views and fxtures for my test cases so it is an easier experience trying to add new views or tests. The same goes for messages.

## Testing

Tests can be run by navigating to the downloaded directory and running `bin/rails test`.

## Features I want to add

I'dd add more here after I see how much I'm able to finish!
