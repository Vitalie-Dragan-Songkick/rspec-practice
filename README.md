# REQUIREMENTS


- Concert should be initialized with an array of artists and the attendee count



- The class should validate the concert:

  - if there are artists present, it should return true

  - if there are are no artists present, it should return false



- The class should show the popularity of the concert based on the number of attendees:

  -  if there are < 500 attendees - it's low popularity

  - if there are between 500-1000 attendees - it's medium popularity

  - if there are over 1000 attendees - it's high popularity






# NEW REQUIREMENTS



- The class now accepts a start date and a concert type.
  - We want to validate that the start date is in the future, and that the provided concert type is valid. Extend the class and write some tests to implement this!
  - e.g - a concert with type 'comedy' or 'theatre' should be invalid.
  -  *Hint - use the provided `VALID_TYPES` constant to help with concert type validation*
 - We want to know who the headliner(s) are.
   - Write and test a `headliners` method to return the headliners for the concert
     - If it's a concert or live stream - it should return the first artist from the artists array
     - If it's a festival there will be multiple headliners - so it should return all the artists in the array
