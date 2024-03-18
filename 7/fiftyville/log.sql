-- Keep a log of any SQL queries you execute as you solve the mystery.

-- SELECT *
-- FROM crime_scene_reports
-- WHERE year = 2021 and month = 7 and day = 28

-- | 295 | 2021 | 7     | 28  | Humphrey Street | Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery. Interviews were conducted today with three witnesses who were present at the time – each of their interview transcripts mentions the bakery. |

-- SELECT *
-- FROM interviews
-- WHERE year = 2021 and month = 7 and day = 28

-- | 160 | Barbara | 2021 | 7     | 28  | “You had my note?” he asked with a deep harsh voice and a strongly marked German accent. “I told you that I would call.” He looked from one to the other of us, as if uncertain which to address.
-- | 161 | Ruth    | 2021 | 7     | 28  | Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away. If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.
-- | 162 | Eugene  | 2021 | 7     | 28  | I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.
-- | 163 | Raymond | 2021 | 7     | 28  | As the thief was leaving the bakery, they called someone who talked to them for less than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket. |

-- Car:

-- SELECT *
-- FROM people
-- WHERE people.license_plate IN (
--     SELECT license_plate
--     FROM bakery_security_logs
--     WHERE year = 2021 and month = 7 and day = 28 and hour = 10 and activity = "exit" and minute <= 25
-- )

-- +--------+---------+----------------+-----------------+---------------+
-- |   id   |  name   |  phone_number  | passport_number | license_plate |
-- +--------+---------+----------------+-----------------+---------------+
-- | 221103 | Vanessa | (725) 555-4692 | 2963008352      | 5P2BI95       |
-- | 243696 | Barry   | (301) 555-4174 | 7526138472      | 6P58WS2       |
-- | 396669 | Iman    | (829) 555-5269 | 7049073643      | L93JTIZ       |
-- | 398010 | Sofia   | (130) 555-0289 | 1695452385      | G412CB7       |
-- | 467400 | Luca    | (389) 555-5198 | 8496433585      | 4328GD8       |
-- | 514354 | Diana   | (770) 555-1861 | 3592750733      | 322W7JE       |
-- | 560886 | Kelsey  | (499) 555-9472 | 8294398571      | 0NTHK55       |
-- | 686048 | Bruce   | (367) 555-5533 | 5773159633      | 94KL13X       |
-- +--------+---------+----------------+-----------------+---------------+

-- Calls:

-- SELECT *
-- FROM phone_calls
-- WHERE year = 2021 and month = 7 and day = 28 and duration < 60

-- SELECT *
-- FROM people
-- WHERE phone_number IN (
--     SELECT caller
--     FROM phone_calls
--     WHERE year = 2021 and month = 7 and day = 28 and duration < 60
-- )

-- +--------+---------+----------------+-----------------+---------------+
-- |   id   |  name   |  phone_number  | passport_number | license_plate |
-- +--------+---------+----------------+-----------------+---------------+
-- | 395717 | Kenny   | (826) 555-1652 | 9878712108      | 30G67EN       |
-- | 398010 | Sofia   | (130) 555-0289 | 1695452385      | G412CB7       |
-- | 438727 | Benista | (338) 555-6650 | 9586786673      | 8X428L0       |
-- | 449774 | Taylor  | (286) 555-6063 | 1988161715      | 1106N58       |
-- | 514354 | Diana   | (770) 555-1861 | 3592750733      | 322W7JE       |
-- | 560886 | Kelsey  | (499) 555-9472 | 8294398571      | 0NTHK55       |
-- | 686048 | Bruce   | (367) 555-5533 | 5773159633      | 94KL13X       |
-- | 907148 | Carina  | (031) 555-6622 | 9628244268      | Q12B3Z3       |
-- +--------+---------+----------------+-----------------+---------------+

-- ATM
-- SELECT *
-- FROM atm_transactions
-- WHERE year = 2021 and month = 7 and day = 28 and atm_location = "Leggett Street" and transaction_type = "withdraw";
-- SELECT name
-- FROM people
-- WHERE people.id IN (
--     SELECT person_id
--     FROM bank_accounts
--     WHERE bank_accounts.account_number IN (
--         SELECT account_number
--         FROM atm_transactions
--         WHERE year = 2021 and month = 7 and day = 28 and atm_location = "Leggett Street" and transaction_type = "withdraw"
--     )
-- )

-- +---------+
-- |  name   |
-- +---------+
-- | Kenny   |
-- | Iman    |
-- | Benista |
-- | Taylor  |
-- | Brooke  |
-- | Luca    |
-- | Diana   |
-- | Bruce   |
-- | Kaelyn  |
-- +---------+


-- +-----+----------------+------+-------+-----+----------------+------------------+--------+
-- | id  | account_number | year | month | day |  atm_location  | transaction_type | amount |
-- +-----+----------------+------+-------+-----+----------------+------------------+--------+
-- | 246 | 28500762       | 2021 | 7     | 28  | Leggett Street | withdraw         | 48     |
-- | 264 | 28296815       | 2021 | 7     | 28  | Leggett Street | withdraw         | 20     |
-- | 266 | 76054385       | 2021 | 7     | 28  | Leggett Street | withdraw         | 60     |
-- | 267 | 49610011       | 2021 | 7     | 28  | Leggett Street | withdraw         | 50     |
-- | 269 | 16153065       | 2021 | 7     | 28  | Leggett Street | withdraw         | 80     |
-- | 275 | 86363979       | 2021 | 7     | 28  | Leggett Street | deposit          | 10     |
-- | 288 | 25506511       | 2021 | 7     | 28  | Leggett Street | withdraw         | 20     |
-- | 313 | 81061156       | 2021 | 7     | 28  | Leggett Street | withdraw         | 30     |
-- | 336 | 26013199       | 2021 | 7     | 28  | Leggett Street | withdraw         | 35     |
-- +-----+----------------+------+-------+-----+----------------+------------------+--------+

-- +----------------+-----------+---------------+
-- | account_number | person_id | creation_year |
-- +----------------+-----------+---------------+
-- | 49610011       | 686048    | 2010          |
-- | 86363979       | 948985    | 2010          |
-- | 26013199       | 514354    | 2012          |
-- | 16153065       | 458378    | 2012          |
-- | 28296815       | 395717    | 2014          |
-- | 25506511       | 396669    | 2014          |
-- | 28500762       | 467400    | 2014          |
-- | 76054385       | 449774    | 2015          |
-- | 81061156       | 438727    | 2018          |
-- +----------------+-----------+---------------+

-- Diana, Bruce

-- Plane

-- SELECT *
-- FROM flights
-- WHERE year = 2021 and month = 7 and day = 29;

-- SELECT full_name
-- FROM airports
-- WHERE id = 8


-- SELECT *
-- FROM people
-- WHERE people.passport_number IN (
--     SELECT passport_number
--     FROM passengers
--     WHERE flight_id IN (
--         SELECT id
--         FROM flights
--         WHERE year = 2021 and month = 7 and day = 29 and hour = 8
--     )
-- )

-- +--------+--------+----------------+-----------------+---------------+
-- |   id   |  name  |  phone_number  | passport_number | license_plate |
-- +--------+--------+----------------+-----------------+---------------+
-- | 395717 | Kenny  | (826) 555-1652 | 9878712108      | 30G67EN       |
-- | 398010 | Sofia  | (130) 555-0289 | 1695452385      | G412CB7       |
-- | 449774 | Taylor | (286) 555-6063 | 1988161715      | 1106N58       |
-- | 467400 | Luca   | (389) 555-5198 | 8496433585      | 4328GD8       |
-- | 560886 | Kelsey | (499) 555-9472 | 8294398571      | 0NTHK55       |
-- | 651714 | Edward | (328) 555-1152 | 1540955065      | 130LD9Z       |
-- | 686048 | Bruce  | (367) 555-5533 | 5773159633      | 94KL13X       |
-- | 953679 | Doris  | (066) 555-9701 | 7214083635      | M51FA04       |
-- +--------+--------+----------------+-----------------+---------------+



-- +-----------------------------+
-- |          full_name          |
-- +-----------------------------+
-- | Fiftyville Regional Airport |
-- +-----------------------------+

-- Bruce

-- SELECT *
-- FROM airports
-- WHERE id IN (
--     SELECT destination_airport_id
--     FROM flights
--     WHERE year = 2021 and month = 7 and day = 29 and hour = 8
-- )

-- +----+--------------+-------------------+---------------+
-- | id | abbreviation |     full_name     |     city      |
-- +----+--------------+-------------------+---------------+
-- | 4  | LGA          | LaGuardia Airport | New York City |
-- +----+--------------+-------------------+---------------+

SELECT name
FROM people
WHERE phone_number IN (
    SELECT receiver
    FROM phone_calls
    WHERE year = 2021 and month = 7 and day = 28 and duration < 60 AND caller IN (
        SELECT phone_number
        FROM people
        WHERE name = "Bruce"
    )
)

-- +-------+
-- | name  |
-- +-------+
-- | Robin |
-- +-------+

