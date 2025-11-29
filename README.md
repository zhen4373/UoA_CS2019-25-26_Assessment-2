# Flying Club Database
### 1. `flying_club.sql`

It includes:
    *   `Rank`: Stores pilot ranks and their associated daily flight limits.
    *   `Pilot`: Contains information about the pilots.
    *   `Instructor`: Holds details for flight instructors.
    *   `Party`: Manages booking parties for pleasure flights.
    *   `Passenger`: Stores information about individual passengers.
    *   `Flight`: The central table for all flights, containing common details.
    *   `TrainingFlight`: A specialized table for training flights, linked to `Flight` and `Instructor`.
    *   `PleasureFlight`: A specialized table for pleasure flights, linked to `Flight` and `Party`.
    *   `Crew`: Assigns pilots to specific flights.
    *   `PartyMember`: Links passengers to a booking party.
*   **Auto-increment Initialization**: `ALTER TABLE` statements to set the starting values for auto-incrementing primary keys.

### 2. `Transaction requirements.sql`
These queries serve as examples for common transactional operations, such as:
*   Listing all trainee officers piloting a flight on a given day.
*   Finding all pilots assigned to a specific pleasure flight.
*   Listing all pleasure flights undertaken by a given pilot.
*   Retrieving the phone number of a specific passenger.
*   Listing all training flights for a given instructor on a specific date.