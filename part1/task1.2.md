![img](/users/124368/files/15544685/preview?verifier=O5fBf7aLJLoM2IyrKOH0LlKhRVtqJ6p5BJSCsGyb)

**Example 1: review_id in the Reviews Table**

**• Primary Key:** review_id

**• Reason for Choice:**

1.**Uniqueness:** Each review should have a unique identifier. Else, identifying different reviews becomes confusing and tough because integrity is present in the records of the review.

**2.Efficient Data Retrieval:** Having the review_id unique means that we can retrieve any specific review quickly and efficiently. This is very important for performance as the number of reviews grows.

**3.Referential Integrity:** It will be possible to refer the primary key of review_id from some other table in case the need arises in future; this way, it would also make sure the relationships between tables are obvious and right.

 

![img](/users/124368/files/15545447/preview?verifier=qLqabo9fSQO3mJnPEut15ngQ0t0DG7fTXVdzBSZC)

**Example 2: booking_id in the Bookings Table**

**• Primary Key:** booking_id

**• Reason for Choice:**

**1.Uniqueness:** Every booking must be uniquely identified to ensure that the related booking record could be separately identifiable, thus avoiding confusion and errors in handling different bookings, and maintaining the integrity of the booking records.

**2.Retrieval:** A unique booking_id ensures fast and efficient retrieval of booking records. As the volume of bookings increases it becomes more and more essential for performance to be able to access individual bookings in an instant, for example in order to serve customers or generate reports or for any other purpose.

**3.Foreign Key Relationships:** The booking_id is used to relate bookings to other tables such as Reviews. This ensures the reviews are correctly related to the correct booking, making it possible to display all of the reviews for a given booking, and whether or not a user has reviewed a booking. This maintainability and clear table relationships support the functionality and data integrity of the system.