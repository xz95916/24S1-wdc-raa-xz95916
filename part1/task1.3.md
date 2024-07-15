**Example from the Schema: Rooms and Facilities**

In our hotel booking system, a room can have multiple facilities, and a facility can be associated with multiple rooms. This creates a many-to-many relationship between Rooms and Facilities.

**Schema Design:**

1. **Rooms Table**:

•room_id (PK)

•hotel_id (FK)

•price_per_night

•number_of_beds

•description

2. **Facilities Table**:

•facility_id (PK)

•facility_name

3. **RoomFacilities Table** (junction table):

•room_id (FK)

•facility_id (FK)

**Decomposition Process:**

To handle the N-N relationship between Rooms and Facilities, we introduced a junction table called RoomFacilities. This table contains foreign keys referencing the primary keys of both Rooms and Facilities. This decomposition ensures that our database schema remains normalized, specifically achieving the third normal form (3NF).

**How This Relates to Database Normalization:**

1. **First Normal Form (1NF)**: Ensures that all columns contain atomic values, and each column contains values of a single type. In our schema, each table adheres to this principle.
2. **Second Normal Form (2NF)**: Ensures that all non-key attributes are fully dependent on the primary key. By decomposing the N-N relationship, we ensure that attributes like facility_name in the Facilities table and price_per_night in the Rooms table are fully dependent on their respective primary keys.
3. **Third Normal Form (3NF)**: Ensures that all attributes are only dependent on the primary key. By introducing the RoomFacilities table, we remove transitive dependencies and ensure that each piece of data is stored in the correct place, linked by foreign keys.

**Benefits of This Approach:**

1. **Data Integrity**: By decomposing the N-N relationship, we ensure that the relationships between rooms and facilities are accurately represented without redundancy.
2. **Maintainability**: Changes to facilities or rooms only need to be made in one place, reducing the risk of data inconsistencies.
3. **Query Efficiency**: Although joins are required to retrieve related data, the database schema is cleaner and easier to understand, and indexing can help maintain performance.