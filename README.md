# FantasyPoints

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

[`localhost:4000`](http://localhost:4000) This endpoint will return a list of users and the last timestamp at which this url was hit.

### Sample Response

`{
  'users': [{id: 1, points: 30}, {id: 72, points: 30}],
  'timestamp': "2022-01-30 17:09:33"
}`

### To run the test cases:
 
 * cd fantasy_points
 * mix test

### About FantasyPoints
 
 * The app starts a genserver when launched.
 * This genserver updates the points of users periodically at an interval of 60 seconds asynchronously.
 * This genserver returns the filteres and returns users having points > `min_number` generated randomly by the genserver at 60 seconds interval.
