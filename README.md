# Trex Back-End

## Table of Contents
- [Setup](#setup)
- [Database Schema](#database-schema)
- [GraphQL Queries](#graphql-queries)
  - [All Travel Advisories](#all-travel-advisories)
  - [Current Location Information](#current-location-information)
  - [Users](#users) 
  - [User and User's Followers](#user-and-users-followers)
  - [User and User's Notifications](#user-and-users-notifications)
  - [User and User's Trips](#user-and-users-trips)
  - [Trip and Trip's Legs](#trip-and-trips-legs)
  - [Leg and Leg Destinations](#leg-and-leg-destinations)
  - [User and User's Notificatons](#user-and-users-notifications)
  - [Leg and Leg Transportations](#leg-and-leg-transportations)
  - [Leg and Leg Lodgings](#leg-and-leg-lodgings)
- [GraphQL Mutations](#graphql-mutations)
  - Trip:
    - [Create Trip](#create-trip)
    - [Update Trip](#update-trip)
    - [Remove Trip](#remove-trip)
  - Leg:
    - [Create Leg](#create-leg)
    - [Update Leg](#update-leg)
    - [Remove Leg](#remove-leg)
  - Destination:
    - [Create Destination](#create-destination)
    - [Update Destination](#update-destination)
    - [Remove Destination](#remove-destination)
  - Lodging:
    - [Create Lodging](#create-lodging)
    - [Update Lodging](#update-lodging)
    - [Remove Lodging](#remove-lodging)
  - Transportation:
    - [Create Transportation](#create-transportation)
    - [Update Transportation](#update-transportation)
    - [Remove Transportation](#remove-transportation)
  - Notification:
    - [Create Notification](#create-notification)
    - [Update Notification](#update-notification)
    - [Remove Notification](#remove-notification)
  - Follower:
    - [Create Follower](#create-follower)
    - [Remove Follower](#remove-follower)
  - User:
    - [Create User](#create-user)
    - [Update User](#update-user)
    - [Remove User](#remove-user)

## Setup

### Install Rails

If you do not have rails installed follow the installations instructions in the link below

- https://gorails.com/setup/osx/10.14-mojave

### Clone Project and Bundle Gems
Navigate to the directory that you would like to store the project in and clone the repo down.

In your terminal run:
1. `$ git clone git@github.com:smainar/trex_backend.git`
1. CD into the project directory
1. `bundle`

### Create the Database
To setup the database on your local machine run the following commands in order:

1. `$ rails db:create`
1. `$ rails db:migrate`
1. `$ rails db:seed`

## Database Schema
![alt text](public/trex_schema.png)

## GraphQL Queries

Query the database for resources and data that <i> belongs_to </i> a resource. Below are example queries, the request can be edited to return all attributes or only the attributes that you need from a given resource.  

### Current Location Information

```graphql
{
  currentLocationInformation(latitude: 43.69973, longitude: 7.25649) {
    id
    code
    hasAdvisoryWarning
    passportInfo
    visaInfo
    vaccineInfo
    healthInfo
    transitInfo
  }
}

```

```
{
  "data": {
    "currentLocationInformation": {
      "id": "8",
      "code": "FR",
      "hasAdvisoryWarning": false,
      "passportInfo": "Entry requirements vary depending on the type of passport you use for travel.Before you travel, check with your transportation company about passport requirements. Its rules on passport validity may be more stringent than the country’s entry rules.Your passport must be valid for at least 3 months beyond the date you expect to leave the Schengen area.Different entry rules may apply.Official travelDifferent entry rules may apply when travelling with a temporary passport or an emergency travel document. Before you leave, check with the closest diplomatic mission for your destination.",
      "visaInfo": "The French government has reintroduced domestic border controls at certain border crossings. Canadians may be required to pass through controls when entering France, even if arriving from another Schengen area country.",
      "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
      "healthInfo": "Good medical care is widely available in France. You may be required to pay in advance, especially if you do not have travel insurance.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety",
      "transitInfo": null
    }
  }
}
```

### Response

```
{
  "data": {
    "travelAdvisories": [
      {
        "id": "115",
        "name": "South Korea",
        "message": "South Korea has a current risk level of 1.6 (out of 5). We advise: Travelling South Korea is (relatively) safe.",
        "score": 1.6
      },
      {
        "id": "116",
        "name": "Kuwait",
        "message": "Kuwait has a current risk level of 2.2 (out of 5). We advise: Travelling Kuwait is (relatively) safe.",
        "score": 2.2
      },
      {
        "id": "237",
        "name": "Zambia",
        "message": "Zambia has a current risk level of 2 (out of 5). We advise: Travelling Zambia is (relatively) safe.",
        "score": 2
      },
      {
        "id": "238",
        "name": "Zimbabwe",
        "message": "Zimbabwe has a current risk level of 2.6 (out of 5). We advise: Use some caution when travelling Zimbabwe.",
        "score": 2.6
      }
    ]
  }
}
```

### Embassies

#### Request

```graphql
{
  embassies(latitude: 43.69973, longitude: 7.25649) {
    id
    name
    address
    website
    phone
    passportServices
    lat
    long

  }
}


```

#### Response

```
{
  "data": {
    "embassies": [
      {
        "id": "17",
        "name": "Embassy of Canada",
        "address": "130, rue du Faubourg Saint-Honoré, 75008 Paris",
        "website": "http://www.france.gc.ca",
        "phone": "+33 (0)1 44 43 29 02",
        "passportServices": true,
        "lat": 48.86685,
        "long": 2.30556
      },
      {
        "id": "18",
        "name": "Consulate of Canada",
        "address": "3, place de la Bourse 69002 Lyon, France",
        "website": "",
        "phone": "33 (0)9 62 56 59 01",
        "passportServices": false,
        "lat": 45.764962,
        "long": 4.836703
      },
      {
        "id": "19",
        "name": "Consulate of Canada",
        "address": "10, rue Lamartine, 06000 Nice, France",
        "website": "",
        "phone": "+33 (0)4 93-92-93-22",
        "passportServices": false,
        "lat": 43.69973,
        "long": 7.25649
      },
      {
        "id": "20",
        "name": "Consulate of Canada",
        "address": "59, allées Jean-Jaurès, 31000 Toulouse, France",
        "website": "",
        "phone": "+33 (0)5-67-31-45-53",
        "passportServices": false,
        "lat": 48.862725,
        "long": 2.287592
      },
      {
        "id": "21",
        "name": "Embassy of Canada",
        "address": "130, rue du Faubourg Saint-Honoré, 75008 Paris",
        "website": "http://www.france.gc.ca",
        "phone": "+33 (0)1 44 43 29 02",
        "passportServices": true,
        "lat": 48.86685,
        "long": 2.30556
      },
      {
        "id": "22",
        "name": "Consulate of Canada",
        "address": "3, place de la Bourse 69002 Lyon, France",
        "website": "",
        "phone": "33 (0)9 62 56 59 01",
        "passportServices": false,
        "lat": 45.764962,
        "long": 4.836703
      },
      {
        "id": "23",
        "name": "Consulate of Canada",
        "address": "10, rue Lamartine, 06000 Nice, France",
        "website": "",
        "phone": "+33 (0)4 93-92-93-22",
        "passportServices": false,
        "lat": 43.69973,
        "long": 7.25649
      },
      {
        "id": "24",
        "name": "Consulate of Canada",
        "address": "59, allées Jean-Jaurès, 31000 Toulouse, France",
        "website": "",
        "phone": "+33 (0)5-67-31-45-53",
        "passportServices": false,
        "lat": 48.862725,
        "long": 2.287592
      }
    ]
  }
}
```

### Users
Returns all users in the database


![User Attributes](screenshots/users.png)

#### Request:

```graphql
{
  users {
    name
    email
    role
    phoneNumber
    latitude
    longitude
  }
}
```

#### Response:

```
{
  "data": {
    "users": [
      {
        "name": "Kimbra Graham",
        "email": "karey.bogan@ullrich.io",
        "role": 0,
        "phoneNumber": "+269 226-235-1014",
        "latitude": 26.3100493248533,
        "longitude": -42.7626012974382
      },
      {
        "name": "Chara Kilback",
        "email": "miguel@blickmacejkovic.co",
        "role": 0,
        "phoneNumber": "+993 493-377-9488",
        "latitude": 83.5111495192167,
        "longitude": 69.4954353441307
      },
      {
        "name": "Gaynelle Grimes",
        "email": "stacia@schowalter.co",
        "role": 0,
        "phoneNumber": "+370 1-759-627-4913 x19660",
        "latitude": -67.9468950646934,
        "longitude": -37.6066730919121
      },
      {
        "name": "Theo Kulas",
        "email": "winfred@friesen.biz",
        "role": 0,
        "phoneNumber": "+387 727.016.9805 x0877",
        "latitude": 33.2302345019916,
        "longitude": -24.0376728019228
      },
      {
        "name": "Carlotta Torphy",
        "email": "edgar@jones.name",
        "role": 0,
        "phoneNumber": "+233 1-988-330-6765",
        "latitude": -3.43103621105386,
        "longitude": 142.436486320976
      },
      {
        "name": "Mrs. Deangelo Mraz",
        "email": "talisha@mckenzie.name",
        "role": 0,
        "phoneNumber": "+30 493.460.5487",
        "latitude": 23.3171973581456,
        "longitude": -123.647234290818
      },
      {
        "name": "Wilhemina Heller",
        "email": "dewayne_grimes@emard.org",
        "role": 0,
        "phoneNumber": "+856 1-856-685-5586 x4722",
        "latitude": -56.0873060357644,
        "longitude": -112.306063215103
      },
      {
        "name": "Leonor MacGyver",
        "email": "corrinne_armstrong@hilpert.info",
        "role": 0,
        "phoneNumber": "+7-6 1-682-507-2900 x698",
        "latitude": -75.1675121754905,
        "longitude": -118.938030209698
      },
      {
        "name": "Mrs. Helene Nader",
        "email": "willie@lefflerzboncak.com",
        "role": 0,
        "phoneNumber": "+256 1-760-080-9321 x03641",
        "latitude": -24.7102437970728,
        "longitude": -170.973197662859
      },
      {
        "name": "Marvella Kautzer",
        "email": "guy_renner@rogahn.org",
        "role": 0,
        "phoneNumber": "+850 759.899.0576 x547",
        "latitude": 88.7583238848613,
        "longitude": 127.028335752735
      },
      {
        "name": "Lory Robel",
        "email": "dagny@spencermarquardt.net",
        "role": 0,
        "phoneNumber": "+254 956-285-3420 x9898",
        "latitude": 53.6142816617883,
        "longitude": -100.468894810743
      }
    ]
  }
}
```

### User and User's Followers
Returns a single User (determined by id) and the user's associated followers

#### Request:
```graphql
{
  user(id: 1) {
    name
    email
    phoneNumber
    friends {
      id
      name
      role
      phoneNumber
    }
    friendships {
      userId
      friendId
      emergencyContact
      relationship
    }
  }
}
```

#### Response:

```
{
  "data": {
    "user": {
      "name": "Maurice Hand",
      "email": "wilson@stanton.io",
      "phoneNumber": "+597 1-963-725-9773 x8231",
      "friends": [
        {
          "id": "2",
          "name": "Olga Runolfsdottir I",
          "role": 0,
          "phoneNumber": "+41 820.515.0717 x46213"
        },
        {
          "id": "3",
          "name": "Lera Kutch",
          "role": 0,
          "phoneNumber": "+228 765-352-5933 x41229"
        },
        {
          "id": "4",
          "name": "Malcolm Braun V",
          "role": 0,
          "phoneNumber": "+47 597-554-6480 x908"
        }
      ],
      "friendships": [
        {
          "userId": 1,
          "friendId": 2,
          "emergencyContact": true,
          "relationship": 0
        },
        {
          "userId": 1,
          "friendId": 3,
          "emergencyContact": false,
          "relationship": 0
        },
        {
          "userId": 1,
          "friendId": 4,
          "emergencyContact": false,
          "relationship": 0
        }
      ]
    }
  }
}
```
### User and User's Notifications
Returns a single User (determined by id) and the user's associated notificiations

#### Request

```graphql
{
  user(id: 1) {
    id
    name
    notificationsSent {
      unread
      message
      senderId
      receiverId
      latitude
      longitude

    }
    notificationsReceived {
      unread
      id
      message
      senderId
    	receiverId
       latitude
      longitude

    }
  }
}

```

#### Response

```

{
  "data": {
    "user": {
      "id": "1",
      "name": "Mrs. Kimbery Robel",
      "notificationsSent": [
        {
          "unread": true,
          "message": "tattooed",
          "senderId": 1,
          "receiverId": 2,
          "latitude": 57.6299,
          "longitude": 39.8737
        },
        {
          "unread": false,
          "message": "cray",
          "senderId": 1,
          "receiverId": 3,
          "latitude": 40.7143,
          "longitude": -74.006
        }
      ],
      "notificationsReceived": [
        {
          "unread": true,
          "id": "1",
          "message": "retro",
          "senderId": 2,
          "receiverId": 1,
          "latitude": 38.0467,
          "longitude": -97.345
        },
        {
          "unread": true,
          "id": "2",
          "message": "drinking",
          "senderId": 2,
          "receiverId": 1,
          "latitude": 37.6394,
          "longitude": 127.0328
        },
        {
          "unread": true,
          "id": "5",
          "message": "Nov 11th",
          "senderId": 2,
          "receiverId": 1,
          "latitude": 1,
          "longitude": 2
        },
        {
          "unread": true,
          "id": "6",
          "message": "Nov 11th",
          "senderId": 2,
          "receiverId": 1,
          "latitude": 1,
          "longitude": 2
        }
      ]
    }
  }
}
```
### User and User's Trips
Returns a single User (determined by id) and the user's associated trips

#### Request:

```graphql
{
  user(id:1) {
    name
    email
    phoneNumber
    trips {
      id
      name
      startDate
      endDate
      userId
    }
  }
}
```

#### Response:

```json
{
  "data": {
    "user": {
      "name": "Kimbra Graham",
      "email": "karey.bogan@ullrich.io",
      "phoneNumber": "+269 226-235-1014",
      "trips": [
        {
          "id": "1",
          "name": "Tunisia",
          "startDate": "2019-06-15",
          "endDate": "2020-02-02",
          "userId": 1
        },
        {
          "id": "2",
          "name": "Madagascar",
          "startDate": "2019-01-17",
          "endDate": "2020-04-27",
          "userId": 1
        },
        {
          "id": "3",
          "name": "Norway",
          "startDate": "2018-12-23",
          "endDate": "2020-04-23",
          "userId": 1
        }
      ]
    }
  }
}
```

### Trip and Trip's Legs
Returns a single trip (by id passed in), and the associated legs

#### Request

```graphql
{
  trip(id:1) {
    name
    startDate
    endDate
    legs {
      id
      name
      startDate
      startLocation
      endDate
      endLocation
      tripId
    }
  }
}
```

#### Response

```json
{
  "data": {
    "trip": {
      "name": "Tunisia",
      "startDate": "2019-06-15",
      "endDate": "2020-02-02",
      "legs": [
        {
          "id": "1",
          "name": null,
          "startDate": "2019-05-19",
          "startLocation": "Purdytown",
          "endDate": "2020-04-16",
          "endLocation": "Purdytown",
          "tripId": 1
        },
        {
          "id": "2",
          "name": null,
          "startDate": "2018-11-13",
          "startLocation": "New Michelinefort",
          "endDate": "2020-05-15",
          "endLocation": "West Freda",
          "tripId": 1
        },
        {
          "id": "3",
          "name": null,
          "startDate": "2019-08-05",
          "startLocation": "North Benmouth",
          "endDate": "2020-02-24",
          "endLocation": "Pollichville",
          "tripId": 1
        },
        {
          "id": "4",
          "name": null,
          "startDate": "2019-01-03",
          "startLocation": "Billieshire",
          "endDate": "2020-01-08",
          "endLocation": "North Laneton",
          "tripId": 1
        }
      ]
    }
  }
}
```

### Leg and Leg Destinations
Returns single leg based on the ID passed in, and the associated destinations

#### Request

```graphql
{
  leg(id: 1) {
    destinations {
      id
      city
      country
      legId
      latitude
      longitude
    }
  }
}
```

#### Response

```json
{
  "data": {
    "leg": {
      "destinations": [
        {
          "id": "1",
          "city": "North Adolfofurt",
          "country": "Morarport",
          "legId": 1,
          "latitude": null,
          "longitude": null
        },
        {
          "id": "2",
          "city": "Williamsonmouth",
          "country": "South Billy",
          "legId": 1,
          "latitude": null,
          "longitude": null
        },
        {
          "id": "3",
          "city": "Langworthberg",
          "country": "Lake Tienland",
          "legId": 1,
          "latitude": 48.3636287,
          "longitude": 7.5945826
        }
      ]
    }
  }
}
```


### Leg and Leg Transportations
Returns single leg based on the ID passed in, and associated transportations

#### Request

```graphql
{
  leg(id: 1) {
    startDate
    startLocation
    endDate
    endLocation
    tripId
  }
  transportations {
    id
    mode
    departureCity
    departureTime
    arrivalTime
    arrivalCity
  }
}
```

#### Response

```json
{
  "data": {
    "leg": {
      "startDate": "2019-05-19",
      "startLocation": "Purdytown",
      "endDate": "2020-04-16",
      "endLocation": "Purdytown",
      "tripId": 1
    },
    "transportations": [
      {
        "id": "1",
        "mode": "flight",
        "departureCity": "Haland",
        "departureTime": "2020-08-02 08:24:19 -0600",
        "arrivalTime": "2019-07-13 02:53:29 -0600",
        "arrivalCity": "North Jules"
      },
      {
        "id": "2",
        "mode": "flight",
        "departureCity": "Taniastad",
        "departureTime": "2020-06-28 14:14:46 -0600",
        "arrivalTime": "2019-07-12 17:52:08 -0600",
        "arrivalCity": "West Ned"
      },
      {
        "id": "3",
        "mode": "flight",
        "departureCity": "East Fatima",
        "departureTime": "2020-04-21 13:47:41 -0600",
        "arrivalTime": "2019-05-07 06:13:31 -0600",
        "arrivalCity": "Faheyborough"
      },
      {
        "id": "4",
        "mode": "flight",
        "departureCity": "Alberttown",
        "departureTime": "2020-02-18 10:31:50 -0700",
        "arrivalTime": "2019-05-21 07:05:17 -0600",
        "arrivalCity": "Camimouth"
      },
      {
        "id": "5",
        "mode": "flight",
        "departureCity": "Gilberteland",
        "departureTime": "2020-10-21 16:29:24 -0600",
        "arrivalTime": "2019-01-30 05:00:12 -0700",
        "arrivalCity": "Bernieborough"
      }
    ]
  }
}
```

### Leg and Leg Lodgings
Returns single leg based on the ID passed in, and the associated lodgings

#### Request

```graphql
{
  leg(id: 1) {
    lodgings {
      name
      arrivalDate
      departureDate
      city
      legId
    }
  }
}
```

#### Response

```json
{
  "data": {
    "leg": {
      "lodgings": [
        {
          "name": "Klein-Mante",
          "arrivalDate": "2019-03-14",
          "departureDate": "2020-07-13",
          "city": "Bartellmouth",
          "legId": 1
        },
        {
          "name": "Schneider-Mayert",
          "arrivalDate": "2019-09-16",
          "departureDate": "2020-03-24",
          "city": "Lake Darrylside",
          "legId": 1
        }
      ]
    }
  }
}
```

## GraphQL Mutations

Mutations include any action that makes a change to the database, a mutation could be creating, deleting or updating a record.

### Create Trip
Creates a new trip, you must pass in the user_id that is associated with the trip

Required Fields
- name
- startDate
- endDate
- userId

#### Request
```graphql
mutation {
  createTrip(
    input: {
      name: "Australia",
      startDate: "Nov 11th",
      endDate: "Dec 1st",
      userId: 1
    })
  {
    trip {
      id
      name
      startDate
      endDate
    }
  }
}
```

#### Response
```json
{
  "data": {
    "createTrip": {
      "trip": {
        "id": "4",
        "name": "Australia",
        "startDate": "Nov 11th",
        "endDate": "Dec 1st"
      }
    }
  }
}
```

### Update Trip

Changes the attributes of a trip. You can change one or all of the attributes.

Required Fields
- id

#### Request

```graphql
mutation {
  updateTrip(
    input: {
      id: 1,
      name: "Mexico City",
      startDate: "Nov 11th",
      endDate: "Dec 1st"
    })
  {
    trip {
      id
      name
      startDate
      endDate
    }
  }
}
```

#### Response
```json
{
  "data": {
    "updateTrip": {
      "trip": {
        "id": "1",
        "name": "Mexico City",
        "startDate": "Nov 11th",
        "endDate": "Dec 1st"
      }
    }
  }
}
```

### Remove Trip
Deletes a trip from the DB. A delete action will delete all legs associated with the trip and all destinations associated with those legs

Required Fields

- id

#### Request

```graphql
mutation {
  removeTrip(
    input: {
      id: 3
    })
  {
    trip {
      id
      name
      startDate
      endDate
    }
  }
}

```
#### Response
```json
{
  "data": {
    "removeTrip": {
      "trip": {
        "id": "3",
        "name": "Norway",
        "startDate": "2018-12-23",
        "endDate": "2020-04-23"
      }
    }
  }
}
```


### Create Leg

Required Fields
- startDate
- endDate
- startLocation
- endLocation
- tripId

#### Request
```graphql
mutation {
  createLeg(
    input: {
      startDate: "10/30/19",
      startLocation: "New York",
      endDate: "11/12/19",
      endLocation: "Oslo",
      tripId: 1
    })
  {
    leg {
      id
      startDate
      startLocation
      endDate
      endLocation
      tripId
    }
  }
}
```

#### Response

```json
{
  "data": {
    "createLeg": {
      "leg": {
        "id": "10",
        "startDate": "10/30/19",
        "startLocation": "New York",
        "endDate": "11/12/19",
        "endLocation": "Oslo",
        "tripId": 1
      }
    }
  }
}
```

### Update Leg

Required Fields
- id

#### Request
```graphql
mutation {
  updateLeg(
    input: {
      id: 10
      startDate: "10/30/19",
      startLocation: "Mexico City",
      endDate: "11/12/19",
      endLocation: "Oslo",
      tripId: 1
    })
  {
    leg {
      id
      startDate
      startLocation
      endDate
      endLocation
      tripId
    }
  }
}

```

### Response

```json
{
  "data": {
    "updateLeg": {
      "leg": {
        "id": "10",
        "startDate": "10/30/19",
        "startLocation": "Mexico City",
        "endDate": "11/12/19",
        "endLocation": "Oslo",
        "tripId": 1
      }
    }
  }
}
```

### Remove Leg

Deletes a leg from the DB. A delete action will delete all destinations associated with the leg.

Required Fields
- id

#### Request
```graphql
mutation {
  removeLeg(
    input: {
      id: 10
    })
  {
    leg {
      id
      startDate
      startLocation
      endDate
      endLocation
      tripId
    }
  }
}
```

#### Response

```json
{
  "data": {
    "removeLeg": {
      "leg": {
        "id": "10",
        "startDate": "10/30/19",
        "startLocation": "Mexico City",
        "endDate": "11/12/19",
        "endLocation": "Oslo",
        "tripId": 1
      }
    }
  }
}
```

### Create Destination
Required Fields
- id
- city
- country

#### Request
```graphql
mutation {
  createDestination(
    input: {
      city: "Oslo",
      country:"Norway"
      legId: 1
    })
  {
    destination {
      id
      city
      country
      latitude
      longitude
      legId
    }
  }
}
```

#### Response

```json
{
  "data": {
    "createDestination": {
      "destination": {
        "id": "4",
        "city": "Oslo",
        "country": "Norway",
        "latitude": 59.9133301,
        "longitude": 10.7389701,
        "legId": 1
      }
    }
  }
}
```

###  Update Destination

#### Request
```graphql
mutation {
  updateDestination(
    input: {
      id: 4,
      city: "Bergen",
      country:"Norway"
      legId: 1
    })
  {
    destination {
      id
      city
      country
      latitude
      longitude
      legId
    }
  }
}
```
#### Response

```json
{
  "data": {
    "updateDestination": {
      "destination": {
        "id": "4",
        "city": "Bergen",
        "country": "Norway",
        "latitude": 60.3943055,
        "longitude": 5.3259192,
        "legId": 1
      }
    }
  }
}
```

### Remove Destination

#### Request
```graphql
mutation {
  removeDestination(
    input: {
      id: 4
    })
  {
    destination {
      id
      city
      country
      latitude
      longitude
      legId
    }
  }
}
```
#### Response
```json
{
  "data": {
    "removeDestination": {
      "destination": {
        "id": "4",
        "city": "Bergen",
        "country": "Norway",
        "latitude": 60.3943055,
        "longitude": 5.3259192,
        "legId": 1
      }
    }
  }
}
```

### Create Lodging

Required Fields
- name
- arrivalDate
- departureDate
- city
- legId

#### Request
```graphql
mutation {
  createLodging(
    input: {
      name: "Queen Anne Hotel",
      arrivalDate: "2019-10-11",
      departureDate:"2019-10-20",
      city: "San Francisco",
      legId: 2
    })
  {
    lodging {
      name
      arrivalDate
      departureDate
      city
      legId
    }
  }
}

```

#### Response

```json
{
  "data": {
    "createLodging": {
      "lodging": {
        "id": "9",
        "name": "Queen Anne Hotel",
        "arrivalDate": "2019-10-11",
        "departureDate": "2019-10-20",
        "city": "San Francisco",
        "legId": 2
      }
    }
  }
}
```

### Update Lodging

Required Fields
- id
- name
- arrivalDate
- departureDate
- city
- legId

#### Request
```graphql
mutation {
  updateLodging(
    input: {
      id: 9,
      name: "La Quinta",
      arrivalDate: "2019-10-11",
      departureDate:"2019-10-20",
      city: "Los Angeles",
      legId: 2
    })
  {
    lodging {
      name
      arrivalDate
      departureDate
      city
      legId
    }
  }
}
```

### Response

```json
{
  "data": {
    "updateLodging": {
      "lodging": {
        "name": "La Quinta",
        "arrivalDate": "2019-10-11",
        "departureDate": "2019-10-20",
        "city": "Los Angeles",
        "legId": 2
      }
    }
  }
}
```

### Remove Lodging

Deletes a lodging from the DB.

Required Fields
- id

#### Request
```graphql
mutation {
  removeLodging(
    input: {
      id: 9
    })
  {
    lodging {
      name
      arrivalDate
      departureDate
      city
      legId
    }
  }
}
```

#### Response

```json
{
  "data": {
    "removeLodging": {
      "lodging": {
        "name": "La Quinta",
        "arrivalDate": "2019-10-11",
        "departureDate": "2019-10-20",
        "city": "Los Angeles",
        "legId": 2
      }
    }
  }
}
```

### Create Transportation

Required Fields
- mode
- arrivalTime
- departureTime
- arrivalCity
- departureCity
- legId

#### Request
```graphql
mutation {
  createTransportation(
    input: {
      mode: "bus",
      departureCity: "Hollywood",
      departureTime: "2020-01-13 16:01:26 -0700",
      arrivalCity: "San Juan",
      arrivalTime: "2019-04-02 04:08:33 -0600",
      legId: 1
    })
  {
    transportation {
      id
      mode
      departureCity
      departureTime
      arrivalCity
      arrivalTime
      legId
    }
  }
}
```

#### Response

```json
{
  "data": {
    "createTransportation": {
      "transportation": {
        "id": "6",
        "mode": "bus",
        "departureCity": "Hollywood",
        "departureTime": "2020-01-13 16:01:26 -0700",
        "arrivalCity": "San Juan",
        "arrivalTime": "2019-04-02 04:08:33 -0600",
        "legId": 1
      }
    }
  }
}
```

### Update Transportation

Required Fields
- id
- mode
- arrivalTime
- departureTime
- arrivalCity
- departureCity
- legId

#### Request
```graphql
mutation {
  updateTransportation(
    input: {
      id: 6,
      mode: "bus",
      departureCity: "Las Vegas",
      departureTime: "2020-01-13 16:01:26 -0700",
      arrivalCity: "Santa Fe",
      arrivalTime: "2019-04-02 04:08:33 -0600",
      legId: 1
    })
  {
    transportation {
      id
      mode
      departureCity
      departureTime
      arrivalCity
      arrivalTime
      legId
    }
  }
}
```

### Response

```json
{
  "data": {
    "updateTransportation": {
      "transportation": {
        "id": "6",
        "mode": "bus",
        "departureCity": "Las Vegas",
        "departureTime": "2020-01-13 16:01:26 -0700",
        "arrivalCity": "Santa Fe",
        "arrivalTime": "2019-04-02 04:08:33 -0600",
        "legId": 1
      }
    }
  }
}
```

### Remove Transportation

Deletes a transportation from the DB.

Required Fields
- id

#### Request
```graphql
mutation {
  removeTransportation(
    input: {
      id: 6
    })
  {
    transportation {
      id
      mode
      departureCity
      departureTime
      arrivalCity
      arrivalTime
      legId
    }
  }
}
```

#### Response

```json
{
  "data": {
    "removeTransportation": {
      "transportation": {
        "id": "6",
        "mode": "bus",
        "departureCity": "Las Vegas",
        "departureTime": "2020-01-13 16:01:26 -0700",
        "arrivalCity": "Santa Fe",
        "arrivalTime": "2019-04-02 04:08:33 -0600",
        "legId": 1
      }
    }
  }
}
```


### Create Notification

Required Fields
- active
- userId

#### Request
```graphql
mutation {
  createNotification(input: {senderId: 2, receiverId: 1, message: "Nov 11th", latitude: 1.0, longitude:2.0}) {
    notification {
      id
      message
      latitude
      longitude
      senderId
      receiverId
    }
  }
}

```

#### Response

```json
{
  "data": {
    "createNotification": {
      "notification": {
        "id": "2",
        "message": "Typewriter art party hammock poutine next level pabst cold-pressed beard chambray.",
        "unread": true
      }
    }
  }
}
```

### Update Notification

Required Fields
- id
- active
- userId

#### Request
```graphql
mutation {
 updateNotification(input: {id: 2, unread: true}) {
    notification {
      id
      message
      unread
    }
  }
}

```

### Response

```json
{
  "data": {
    "updateNotification": {
      "notification": {
        "id": "2",
        "message": "Typewriter art party hammock poutine next level pabst cold-pressed beard chambray.",
        "unread": true
      }
    }
  }
}
```


### Create Follower

Required Fields
- friendId
- userId

#### Request
```graphql
mutation {
  createFriendship(
    input: {
      friendId: 9
      userId: 1
    })
  {
    friends {
      id
      name
      email
      phoneNumber
      role
    }
  }
}
```

#### Response

```json
{
  "data": {
    "createFriendship": {
      "friends": [
        {
          "id": "2",
          "name": "Chara Kilback",
          "email": "miguel@blickmacejkovic.co",
          "phoneNumber": "+993 493-377-9488",
          "role": 0
        },
        {
          "id": "3",
          "name": "Gaynelle Grimes",
          "email": "stacia@schowalter.co",
          "phoneNumber": "+370 1-759-627-4913 x19660",
          "role": 0
        },
        {
          "id": "4",
          "name": "Theo Kulas",
          "email": "winfred@friesen.biz",
          "phoneNumber": "+387 727.016.9805 x0877",
          "role": 0
        },
        {
          "id": "9",
          "name": "Mrs. Helene Nader",
          "email": "willie@lefflerzboncak.com",
          "phoneNumber": "+256 1-760-080-9321 x03641",
          "role": 0
        }
      ]
    }
  }
}
```

### Remove Follower

Deletes a follower that is associated with that wanderer.

Required Fields
- id

#### Request
```graphql
mutation {
  removeFriendship(
    input: {
      id: 9
    })
   {
    message
  }
}
```

#### Response

```json
{
  "data": {
    "removeFriendship": {
      "message": "You deleted a follower!"
    }
  }
}
```

### Create User

Required Fields
- name
- email
- role
- phoneNumber

#### Request
```graphql
mutation {
  createUser(
    input: {
      name: "Harry Potter",
      email: "theboywholived@hogwarts.com",
    	phoneNumber: "+020 123-456-7890",
    	role: 0
    })
  {
    user {
      id
      name
      email
      phoneNumber
      role
    }
  }
}
```

#### Response

```json
{
  "data": {
    "createUser": {
      "user": {
        "id": "12",
        "name": "Harry Potter",
        "email": "theboywholived@hogwarts.com",
        "phoneNumber": "+020 123-456-7890",
        "role": 0
      }
    }
  }
}
```

### Update User

Required Fields
- id
- name
- email
- role
- phoneNumber

#### Request
```graphql
mutation {
  updateUser(
    input: {
      id: 12
      name: "Harry Potter",
      email: "harry@ministryofmagic.com",
    	phoneNumber: "+020 123-456-7890",
    	role: 0
    })
  {
    user {
      id
      name
      email
      phoneNumber
      role
    }
  }
}
```

### Response

```json
{
  "data": {
    "updateUser": {
      "user": {
        "id": "12",
        "name": "Harry Potter",
        "email": "harry@ministryofmagic.com",
        "phoneNumber": "+020 123-456-7890",
        "role": 0
      }
    }
  }
}
```

### Remove User

Deletes a user from the DB.

Required Fields
- id

#### Request
```graphql
mutation {
  removeUser(
    input: {
      id: 12
    })
  {
    user {
      id
      name
      email
      phoneNumber
      role
    }
  }
}
```

#### Response

```json
{
  "data": {
    "removeUser": {
      "user": {
        "id": "12",
        "name": "Harry Potter",
        "email": "theboywholived@hogwarts.com",
        "phoneNumber": "+020 987-654-3210",
        "role": 0
      }
    }
  }
}
```
