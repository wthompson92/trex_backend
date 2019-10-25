# Trex Back-End

## Table of Contents
- [Setup](#setup)
- [GraphQL Queries](#graphql-queries)
  - [All Travel Advisories](#all-travel-advisories)
  - [Users](#users)
  - [User and User's Trips](#user-and-users-trips)
  - [Trip and Trip's Legs](#trip-and-trips-legs)
  - [Leg and Leg Destinations](#leg-and-leg-destinations)
  - [User and User's Notificatons](#user-and-users-notifications)
  - [Leg and Leg Transportations](#leg-and-leg-transportations)
  - [Destination and Destination Lodgings](#destination-and-destination-lodgings)
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
    - [Create Transporation](#create-transporation)
    - [Update Transportation](#update-transporation)
    - [Remove Transportation](#remove-transporation)
  - Notification:
    - [Create Notification](#create-notification)
    - [Update Notification](#update-notification)
    - [Remove Notification](#remove-notification)

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

## GraphQL Queries

Query the database for resources and data that <i> belongs_to </i>  a resource.  Below are example queries, the request can be edited to return all attributes or only the attributes that you need from a given resource .  

### Country Information

```graphql
{
  countriesInfo {
    id
    hasAdvisoryWarning
    passportInfo
    visaInfo
    vaccineInfo
    transitInfo
    healthInfo
  }
}


```json
{
  "data": {
    "countriesInfo": [
      {
        "id": "1",
        "hasAdvisoryWarning": false,
        "passportInfo": "Entry requirements vary depending on the type of passport you use for travel.Before you travel, check with your transportation company about passport requirements. Its rules on passport validity may be more stringent than the country’s entry rules.Your passport must be valid for at least 3 months beyond the date you expect to leave the Schengen area.Different entry rules may apply.Official travelDifferent entry rules may apply when travelling with a temporary passport or an emergency travel document. Before you leave, check with the closest diplomatic mission for your destination.",
        "visaInfo": "The French government has reintroduced domestic border controls at certain border crossings. Canadians may be required to pass through controls when entering France, even if arriving from another Schengen area country.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": null,
        "healthInfo": "Good medical care is widely available in France. You may be required to pay in advance, especially if you do not have travel insurance.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "2",
        "hasAdvisoryWarning": false,
        "passportInfo": "Tourist visa: Not requiredBusiness visa: RequiredStudent visa: RequiredIf you’re entering the UAE as a tourist, you must obtain an entry stamp at the port of entry. This entry stamp is free and valid for 30 days. It’s renewable for a further 30 days.",
        "visaInfo": "If you’re planning to work or reside in the UAE, you must undergo medical tests, including a test for human immunodeficiency virus (HIV) infection. If you’re found to be HIV-positive, you may subject to deportation. Emirati authorities don’t recognize foreign-issued HIV certificates. Positive tests for other communicable diseases may result in quarantine, treatment or deportation.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Air travel\", :description=>\"We do not make assessments on the compliance of foreign domestic airlines with international safety standards.General information about foreign domestic airlines\"}",
        "healthInfo": "Adequate health care is available in large cities, including private clinics. Immediate payment is usually necessary at the time of treatment. Certain prescriptions are available from local doctors.Medical evacuation can be very expensive. You may need it in case of serious illness or injury. Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "3",
        "hasAdvisoryWarning": true,
        "passportInfo": "You must obtain a visa to visit Afghanistan.Tourist visa: RequiredBusiness visa: RequiredStudent visa: RequiredIf your emergency contingency plan involves a possible evacuation to a third country by air or road, be sure to maintain a valid visa for that country.",
        "visaInfo": "Afghan authorities fingerprint all foreigners upon arrival in Afghanistan. You must also register with a representative of the Ministry of Interior’s Foreigners’ Registration Office. This can be done at Hamid Karzai International Airport in Kabul or the Ministry of Interior’s Kabul Statistics Office, located at Kart-e-Parwan Square.You must surrender your registration card when departing Afghanistan.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Air travel\", :description=>\"We do not make assessments on the compliance of foreign domestic airlines with international safety standards.General information about foreign domestic airlinesConfirm your flight with your airline before flying to Afghanistan, as Afghan airports can close on short notice. For this same reason, if you’re departing from Afghanistan, contact your airline to confirm your flight.\"}",
        "healthInfo": "Health care is inadequate. It may be completely unavailable in rural areas. Where available, health-care facilities are not appropriately sanitized. Patients requiring medical treatment for incisions or wounds run a significant risk of infection. Private clinics are available in Kabul. These clinics offer a higher standard of service. Immediate cash payment is required for any medical service.Medical evacuation can be very expensive and you may need it in case of serious illness or injury. Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays. However, medical evacuation is rarely possible due to a lack of companies willing to service Afghanistan. Evacuation on military flights is impossible.Prescription medications are not available. Bring a sufficient supply of medications for the duration of your stay.Travel health and safety "
      },
      {
        "id": "4",
        "hasAdvisoryWarning": false,
        "passportInfo": "Tourist visa: Not requiredBusiness visa: RequiredStudent visa: RequiredIf you’re entering the UAE as a tourist, you must obtain an entry stamp at the port of entry. This entry stamp is free and valid for 30 days. It’s renewable for a further 30 days.",
        "visaInfo": "If you’re planning to work or reside in the UAE, you must undergo medical tests, including a test for human immunodeficiency virus (HIV) infection. If you’re found to be HIV-positive, you may subject to deportation. Emirati authorities don’t recognize foreign-issued HIV certificates. Positive tests for other communicable diseases may result in quarantine, treatment or deportation.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Air travel\", :description=>\"We do not make assessments on the compliance of foreign domestic airlines with international safety standards.General information about foreign domestic airlines\"}",
        "healthInfo": "Adequate health care is available in large cities, including private clinics. Immediate payment is usually necessary at the time of treatment. Certain prescriptions are available from local doctors.Medical evacuation can be very expensive. You may need it in case of serious illness or injury. Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "5",
        "hasAdvisoryWarning": true,
        "passportInfo": "You must obtain a visa to visit Afghanistan.Tourist visa: RequiredBusiness visa: RequiredStudent visa: RequiredIf your emergency contingency plan involves a possible evacuation to a third country by air or road, be sure to maintain a valid visa for that country.",
        "visaInfo": "Afghan authorities fingerprint all foreigners upon arrival in Afghanistan. You must also register with a representative of the Ministry of Interior’s Foreigners’ Registration Office. This can be done at Hamid Karzai International Airport in Kabul or the Ministry of Interior’s Kabul Statistics Office, located at Kart-e-Parwan Square.You must surrender your registration card when departing Afghanistan.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Air travel\", :description=>\"We do not make assessments on the compliance of foreign domestic airlines with international safety standards.General information about foreign domestic airlinesConfirm your flight with your airline before flying to Afghanistan, as Afghan airports can close on short notice. For this same reason, if you’re departing from Afghanistan, contact your airline to confirm your flight.\"}",
        "healthInfo": "Health care is inadequate. It may be completely unavailable in rural areas. Where available, health-care facilities are not appropriately sanitized. Patients requiring medical treatment for incisions or wounds run a significant risk of infection. Private clinics are available in Kabul. These clinics offer a higher standard of service. Immediate cash payment is required for any medical service.Medical evacuation can be very expensive and you may need it in case of serious illness or injury. Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays. However, medical evacuation is rarely possible due to a lack of companies willing to service Afghanistan. Evacuation on military flights is impossible.Prescription medications are not available. Bring a sufficient supply of medications for the duration of your stay.Travel health and safety "
      },
      {
        "id": "6",
        "hasAdvisoryWarning": false,
        "passportInfo": "Tourist visa: not requiredBusiness visa: not requiredStudent permit: required",
        "visaInfo": "Customs officials may ask you to show them a return or onward ticket and proof of sufficient funds to cover your stay. ",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": null,
        "healthInfo": "Heath care services are adequate in Antigua but extremely limited in Barbuda.There is no decompression chamber available on the islands to treat diving-related injuries. Cases are referred to Guadeloupe or Saba.Clinics and hospitals may expect immediate cash payment for medical services.You will likely need medical evacuation in case of serious illness or injury.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "7",
        "hasAdvisoryWarning": false,
        "passportInfo": "Tourist visa: not requiredBusiness visa: not requiredStudent visa: not required",
        "visaInfo": "Customs officials may ask you to show them a return or onward ticket.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": null,
        "healthInfo": "Health care is adequate but may be limited.You will likely need medical evacuation in case of serious illness or injury.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "8",
        "hasAdvisoryWarning": false,
        "passportInfo": "Tourist visa: not required for stays up to 90 days per six-month periodBusiness visa: not required for stays up to 90 days per six-month periodStudent visa: not required for stays up to 90 days per six-month periodIf you wish to stay or work in Albania for more than 90 days, you must apply for a resident permit (leje qëndrimi) or a work permit (leje pune).",
        "visaInfo": "The Albanian government may consider children born to an Albanian parent to be Albanian citizens even if they were born in Canada and have a Canadian passport. Children under the age of 18 are only allowed to leave Albania with both parents, or with the consent of both parents. The absent parent(s) must provide a statement of parental consent to travel, notarized by Albanian authorities, to be presented upon exiting Albania.Parents of children travelling alone or with one parent are strongly encouraged toContact the Embassy of the Republic of Albania in Canada before departure to ensure that the entry and exit requirements are met if your child plan travelling alone or with one parent only.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Demonstrations\", :description=>\"Demonstrations take place from time to time.Even peaceful demonstrations can turn violent at any time. They can also lead to disruptions to traffic and public transportation.More about mass gatherings (large-scale events)\"}",
        "healthInfo": "Good health care is limited in availability. Quality of care varies greatly throughout the country.Access to medical equipment, pharmaceuticals, and specialists is limited.  It is best to avoid government hospitals, which often lack basic drugs and equipment and have poor hygiene standards.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "9",
        "hasAdvisoryWarning": false,
        "passportInfo": "Canadians must have a visa to visit Armenia.Transit visa: Required for stays up to three daysVisitor visa (tourism and business travel): Required for stays up to 120 daysThere are 3 ways of obtaining a visa:Apply for an e-visa - Armenia’s Ministry of Foreign Affairs",
        "visaInfo": "Learn about potential entry requirements related to yellow fever (vaccines section).",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": null,
        "healthInfo": "Modern medical services and facilities are available in Yerevan. Outside Yerevan, facilities are limited and may not offer the level of care you may be used to in Canada.Serious medical cases may require evacuation to a country equipped with adequate facilities.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "10",
        "hasAdvisoryWarning": false,
        "passportInfo": "You must be in possession of a visa and an onward or return ticket to enter Angola.To obtain a visa, you must first get a Canadian criminal clearance certificate, which can only be obtained while in Canada from your local police or the RCMP, before travelling. The police clearance must be submitted, along with your visa application, in both English and a Portuguese translation, which must be notarized.The length of stay on your tourist visa may not exceed 30 days, but the visa can be renewed once, for a maximum of 30 days.Angolan visas take an entire page in your passport and are preferably followed by one blank page. Ensure you have enough pages remaining in your passport, as additional pages cannot be added to a passport and issuing a new passport may take several weeks. While in Angola with family members, including children, ensure that their documentation is up-to-date at all times.Airport and road check procedures have been reinforced. Any issue relating to documentation or identification, including visas and vaccination cards, can lead to delays or denial of entry. Ensure that you have obtained the appropriate visa before arriving in Angola. You cannot obtain a visa at the airport.If you arrive in Angola without the required visa, you could face arrest and/or deportation. Travellers who overstay their visa are subject to heavy fines and possible arrest.Tourist visa: RequiredBusiness visa: RequiredStudent visa: RequiredEmployment visa: RequiredTransit visa: Required",
        "visaInfo": "Learn about potential entry requirements related to yellow fever (vaccines section).",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Road safety\", :description=>\"Roads, particularly secondary and tertiary roads, and bridges are generally in poor condition.Incidents of drivers under the influence of alcohol are common, especially on weekends. The return trip to Luanda from beach outings can be particularly hazardous due to reckless driving habits. Be extremely careful of unexpected hazards on the road, such as pedestrians and animals.Always drive with the doors locked and the windows rolled up. Keep your valuables out of sight.Only undertake overland travel outside of urban centres in convoys of at least two vehicles, ideally four-wheel drive vehicles.\"}",
        "healthInfo": "Medical treatment is very expensive, and payment in advance is required. Medical facilities are very poor throughout the country, including in Luanda.Many doctors and medical staff do not speak English or French, including in Luanda; they speak Portuguese.Serious medical emergencies should be treated outside the country.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "11",
        "hasAdvisoryWarning": false,
        "passportInfo": "Travellers on Canadian expeditions, Canadian vessels and those operating Canadian aircraft need a permit to be in the Antarctic, except when granted permission from another party to the Madrid Protocol (which protects the Antarctic’s environment) or in the case of an emergency. There is no fee associated with processing a permit to travel to the Antarctic.Antarctic Environmental Protection Act: permits – Government of Canada",
        "visaInfo": "Learn about travel with children.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": null,
        "healthInfo": "There are no organized nor stand-by search and rescue or emergency evacuation facilities in Antarctica. In case of emergency, you will be responsible for the costs of your search, rescue and evacuation.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "12",
        "hasAdvisoryWarning": false,
        "passportInfo": "Tourist visa: Not requiredBusiness visa: Not required Student visa: Required",
        "visaInfo": "Upon entry into and exit from Argentina, all passengers, regardless of their citizenship, are submitted to biometrics checks, such as digital fingerprints and a digital photograph, at the immigration counter.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Demonstrations\", :description=>\"Demonstrations, roadblocks and strikes may occur throughout the country at any time.Even peaceful demonstrations can turn violent at any time. They can also lead to disruptions to traffic and public transportation.More about mass gatherings (large-scale events)\"}",
        "healthInfo": "Medical facilities are good in Buenos Aires but limited elsewhere. Certain medications may not be available.Hospital physicians often expect immediate cash payment for medical care, so ensure you have access to sufficient funds. Contact your insurance company promptly if you are referred to a medical facility for treatment.See Travel Insurance for more information."
      },
      {
        "id": "13",
        "hasAdvisoryWarning": false,
        "passportInfo": "Learn about potential entry requirements related to yellow fever (vaccines section).",
        "visaInfo": "Learn about travel with children. ",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": null,
        "healthInfo": "Medical facilities are limited. Health-care facilities are adequate for routine treatments, but limited in range and availability. Immediate cash payment for health services is expected. Pack a travel health kit, especially if you’ll be travelling away from major city centres.There is a hyperbaric (decompression) chamber available at the LBJ Tropical Medical Center (Tel.: +1 684 633 1222) in Fagaalu on the island of Tutuila.Medical evacuation can be very expensive and you may need it in case of serious illness or injury.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "14",
        "hasAdvisoryWarning": false,
        "passportInfo": "Entry requirements vary depending on the type of passport you use for travel.Before you travel, check with your transportation company about passport requirements. Its rules on passport validity may be more stringent than the country’s entry rules.Your passport must be valid for at least 3 months beyond the date you expect to leave from the Schengen area.Different entry rules may apply.Official travelDifferent entry rules may apply when travelling with a temporary passport or an emergency travel document. Before you leave, check with the closest diplomatic mission for your destination.",
        "visaInfo": "Tourist visa: Not required for stays up to 90 daysBusiness visa: Not required for stays up 90 daysWork visa: RequiredStudent visa: Required",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Mountain activities\", :description=>\"If you intend to do mountaineering or skiing:\"}",
        "healthInfo": "Healthcare is excellent. Service is available throughout the country.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "15",
        "hasAdvisoryWarning": false,
        "passportInfo": "Tourist visa: required Business visa: required Student visa: requiredCanadians must also be in possession of an electronic travel authority (ETA) to visit Australia. Ensure that you travel with the same passport used to apply for your ETA.A health examination might be necessary to obtain certain visas.",
        "visaInfo": "Learn about travel with children.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Spiked food and drinks\", :description=>\"Never leave food or drinks unattended or in the care of strangers. Be wary of accepting snacks, beverages, gum or cigarettes from new acquaintances, as they may contain drugs that could put you at risk of sexual assault and robbery.\"}",
        "healthInfo": "Health care is excellent. Service is available throughout the country.Payment is expected at time of service.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "16",
        "hasAdvisoryWarning": false,
        "passportInfo": "Tourist visa: not required (for stays of up to 30 days)Business visa: not requiredWork permit: requiredStudent visa: required",
        "visaInfo": "Customs officials will ask you to show them a return or onward ticket, a proof of sufficient funds to cover your stay and a proof of health insurance to enter Aruba.You must have a completely filled-in and signed Embarkation and Disembarkation card (ED-card). It can be completed online, upon booking your travel.ED-card Aruba",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": null,
        "healthInfo": "Health care is very good. Service is available throughout the country. Medical facilities are well-equipped. Hospitals offer several classes of service. Patients are accommodated according to the level of their insurance coverage and ability to pay.There is no decompression chamber on the island.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "17",
        "hasAdvisoryWarning": false,
        "passportInfo": "Canadians must be in possession of a visa to visit Azerbaijan.Tourist visa: RequiredBusiness visa: RequiredStudent visa: RequiredTransit visa: RequiredIf you plan to visit Azerbaijan, you must have a visa before arriving in the country. As a tourist, you can apply for an e-visa through Azerbaijan’s online visa portal. You should do so at least 3 days before your planned arrival date.If you require any other type of visa, you must apply for it from the Embassy of the Republic of Azerbaijan prior to departure.To obtain any type of visa, you must present a letter of invitation from a contact in Azerbaijan, such as an employer or educational institution. If you do not have a contact in Azerbaijan, the invitation letter should be submitted by the travel agency in Azerbaijan.If you plan to stay for more than 10 days, you must register with police upon arrival and ensure that your passport is stamped with a residency stamp. You may also register your stay online through the State Migration Service. Failure to register could result in a fine. You may be stopped from leaving Azerbaijan until the fine is paid.",
        "visaInfo": "You may encounter long delays or be denied entry at the Azerbaijani border if your passport contains a stamp from the disputed Nagorno–Karabakh region.It is illegal to enter Nagorno–Karabakh from Azerbaijan without permission from Azerbaijani authorities. Violations of entry and exit regulations to and from this area can result in serious penalties.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Road safety\", :description=>\"Highways and major city roads are well-maintained, but driving can still be dangerous due to poor driving standards and poorly maintained cars. Insufficient street lighting and signage make travel dangerous outside of Baku. The risk increases on certain roads that are shared with pedestrians and livestock.Authorities do not enforce traffic rules consistently.Pedestrians should exercise caution.\"}",
        "healthInfo": "Service standards are different than those in Canada. Avoid older medical clinics as they often lack basic drugs and equipment and have poor hygiene standards. Medical facilities outside Baku are very limited. Some medical clinics require upfront payment for treatment. Medical evacuation, which can be very expensive, may be necessary in the event of serious illness or injury. Make sure you have travel insurance that covers all medical expenses, including hospitalization abroad and medical evacuation, in case of illness or injury."
      },
      {
        "id": "18",
        "hasAdvisoryWarning": false,
        "passportInfo": "Tourist visa: Not required for stays up to 90 daysBusiness visa: Not required for stays up to 90 daysStudent visa: Not required for stays up to 90 days",
        "visaInfo": "If you plan to visit for 3 or more days, you must register with local police within 48 hours of your arrival in the country.If you’re staying in a hotel, the staff will register you. If not, you can find the registration form on the Ministry of Security’s Service for Foreigners’ Affairs website.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Air travel\", :description=>\"We do not make assessments on the compliance of foreign domestic airlines with international safety standards.General information about foreign domestic airlines\"}",
        "healthInfo": "Good medical services and facilities are available, but service could be limited outside of major cities. Private clinics are available. Immediate payment is required. Make sure you have travel insurance that covers all medical expenses, including hospitalization abroad and medical evacuation, in case of illness or injury."
      },
      {
        "id": "19",
        "hasAdvisoryWarning": false,
        "passportInfo": "Tourist visa: not required Business visa: not requiredWork visa: requiredStudent visa: required",
        "visaInfo": "The length of stay for tourists—up to a maximum of 6 months—is determined by immigration officers.They also determine if a work permit is required of business travellers.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Air travel\", :description=>\"We do not make assessments on the compliance of foreign domestic airlines with international safety standards.General information about foreign domestic airlines\"}",
        "healthInfo": "Medical facilities in Barbados are adequate. There is one public hospital, the Queen Elizabeth Hospital, one private hospital, the Bayview Hospital, and several private clinics across the island.A hyperbaric chamber is located at the Barbados Defence Force base on Needham’s Point.Some clinics and hospitals may expect immediate cash payment for medical services.Police and ambulance response can be slow.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "20",
        "hasAdvisoryWarning": false,
        "passportInfo": "Tourist visa: required (for stays up to 30 days)Business visa: required (for stays up to 30 days)Student visa: RequiredYou should obtain a visa before travelling to Bangladesh. While you can apply for single-entry tourist and business visas upon arrival at the airport in Bangladesh, there is a risk of being denied entry into the country.",
        "visaInfo": "You must carry all documents pertaining to the purpose of your visit and declare funds in excess of US$5000. Be prepared to show proof of both onward travel and sufficient funds for your stay.If you are travelling for business, you must also produce:",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Attacks on minorities\", :description=>\"Extremists have targeted religious minorities including Hindus, Buddhist and Christians, as well as secular writers, including some foreigners.\"}",
        "healthInfo": "Health care is inadequate. Patients with serious conditions often require medical evacuations to Singapore or Thailand. Doctors and hospitals may expect immediate cash payment for health services.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "21",
        "hasAdvisoryWarning": false,
        "passportInfo": "Entry requirements vary depending on the type of passport you use for travel.Before you travel, check with your transportation company about passport requirements. Its rules on passport validity may be more stringent than the country’s entry rules.Your passport must be valid for at least 3 months beyond the date you expect to leave the Schengen area.Different entry rules may apply.Official travelDifferent entry rules may apply when travelling with a temporary passport or an emergency travel document. Before you leave, check with the closest diplomatic mission for your destination.",
        "visaInfo": "The Belgian government may reintroduce internal border controls at short notice and Canadians may be required to pass through immigration controls when entering Belgium, even if arriving from another Schengen area country.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": null,
        "healthInfo": "Health care is excellent in Belgium. The responsiveness of emergency services is generally very good. If you are referred to a medical facility for treatment you should inform your insurance/medical assistance company immediately.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "22",
        "hasAdvisoryWarning": true,
        "passportInfo": "You must have a visa.Tourist visa: RequiredBusiness visa: RequiredStudent visa: Required",
        "visaInfo": "Learn about travel with children.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Crime \", :description=>\"Petty crime, such as pickpocketing and purse snatching, occurs in major cities. In Ouagadougou, the areas around the United Nations roundabout and Central Market are often targeted by thieves. Petty crime occurs to a lesser degree elsewhere in the country.\"}",
        "healthInfo": "Medical facilities and supplies are very limited outside the capital. Clinics and doctors often request cash payment.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "29",
        "hasAdvisoryWarning": false,
        "passportInfo": "Tourist visa: required for stays of more than 14 daysBusiness visa: required for stays of more than 14 daysStudent visa: requiredIf you need a visa, you must have at least 6 blank pages in your passport.",
        "visaInfo": "You will not be allowed entry into Brunei if you have HIV/AIDS or any other communicable disease. You will be asked to complete a health declaration form upon entry.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": null,
        "healthInfo": "Medical services and facilitiesMedical facilities are good, but medical evacuation to Singapore may be necessary for serious medical problems.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "23",
        "hasAdvisoryWarning": false,
        "passportInfo": "You must present proof of medical insurance (minimum €30,000 coverage) that’s valid in the European Union (EU) and covers the costs of emergency medical care and evacuation.",
        "visaInfo": "Tourist visa: Not required for stays of fewer than 90 days in any 180-day periodBusiness visa: Not required for stays of fewer than 90 days in any 180-day periodStudent visa: Not required for stays of fewer than 90 days in any 180-day periodYou must obtain a visa before travelling if you plan to stay in Bulgaria for more than 90 days. Bulgaria doesn’t grant extensions once you’re in the country, except in cases of emergency or marriage to a Bulgarian citizen.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Stray dogs\", :description=>\"Beware of stray dogs, especially those travelling in packs. They can be dangerous and could expose you to disease if they bite you.\"}",
        "healthInfo": "Health care is inadequate. Private hospitals and clinics located in cities are often better staffed and equipped than public or rural facilities. Cash payment is required at time of service.Medical evacuation can be very expensive and you may need it in case of serious illness or injury. Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "24",
        "hasAdvisoryWarning": false,
        "passportInfo": "Canadians must have a visa to visit Bahrain.Tourist visa: Required Business visa: RequiredStudent visa: RequiredYou should obtain a visa from the nearest Bahraini government office prior to arrival. Tourists can also obtain their visa online from Bahrain eVisas.",
        "visaInfo": "The Government of Bahrain has implemented measures restricting the entry of Qatari citizens and foreign residents of Qatar into Bahrain. These measures should not affect Canadians travelling to or transiting through Qatar. If you are a resident of Qatar, contact diplomatic representatives of Bahrain to confirm current entry requirements.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Sea travel\", :description=>\"There is a curfew in effect on the waterways around Bahrain from 6 p.m. to 4 a.m. Vessels operating in these waters may be detained and inspected, even outside curfew hours.Exercise increased caution when travelling by dhow (small sailboat), as they may not be up to Canadian safety standards.\"}",
        "healthInfo": "Adequate medical services are available in Bahrain. Immediate payment is required."
      },
      {
        "id": "25",
        "hasAdvisoryWarning": true,
        "passportInfo": "Tourist: requiredBusiness: required",
        "visaInfo": "Due to the volatile security situation in the area, authorities could close the Burundi–Rwanda border at any time.Periodic closure of the Burundi–Democratic Republic of Congo border can occur without notice.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Crime\", :description=>\"Incidents of muggings, purse snatching and pickpocketing occur. Crime is often committed by children. Criminal activity increases at night.There is a risk of assault if you’re walking or jogging alone, particularly on roads around Lake Tanganyika. Avoid walking, driving or taking public transportation after dark anywhere in the country.Keep valuables, travel documents, and cash in safe locations, such as in hotel safes. Keep separate and digital copies of important documents, including your passport.\"}",
        "healthInfo": "Health care is inadequate. You will likely need medical evacuation in case of serious illness or injury. For medical evacuations, planes need to fly in from other countries.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "26",
        "hasAdvisoryWarning": false,
        "passportInfo": "Canadians must be in possession of a visa prior to arriving in Benin.Tourist visa: RequiredBusiness visa: RequiredStudent visa: Required",
        "visaInfo": "Learn about travel with children.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Road safety\", :description=>\"Road conditions range from fair to poor.Watch for vehicles changing lanes without warning because of broken-down vehicles and potholes in their path.There are paved roads in Cotonou and along the coast, and one leading north to Niger. Other roads are made of hard-packed sand and may become impassable during the rainy seasons.Poor driving habits, inadequate street lighting, motorcycle traffic and overloaded trucks pose additional hazards.Avoid overland travel after dark, particularly on the coastal highway, in the border regions with Nigeria and Nigeria, and on the road linking Cotonou and Parakou.In case of an accident resulting in injury, take the individual directly to the hospital. If witnesses are hostile, go immediately to the nearest police station.Fuel shortages are frequent in the rural areas of northern Benin.\"}",
        "healthInfo": "Medical facilities are adequate in Cotonou but supplies of medicine are limited throughout the country.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "27",
        "hasAdvisoryWarning": false,
        "passportInfo": "Tourist visa: Not required for stays up to 90 days within a six-month periodProfessional visa: RequiredStudent visa: Required",
        "visaInfo": "Customs officials may ask you to show them a return ticket.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": null,
        "healthInfo": "Good quality medical services are available.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "28",
        "hasAdvisoryWarning": false,
        "passportInfo": "Tourist visa: Not required Business visa: Not required Student visa: Required",
        "visaInfo": "Learn about travel with children.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": null,
        "healthInfo": "Medical facilities and services are good, but are expensive and limited. Medical evacuation to the United States, likely to Baltimore or Boston, may be required in the event of serious illness or injury. Make sure you have travel insurance that covers all medical expenses, including hospitalization abroad and medical evacuation.Learn more about travel health and safety."
      },
      {
        "id": "30",
        "hasAdvisoryWarning": false,
        "passportInfo": "Tourist visa: not required for stays up to 30 daysBusiness visa: required Student visa: requiredIf you’re a Canadian citizen travelling to Bolivia for volunteer work, you should obtain the Visa of Determined Purpose from the Bolivian embassy or consulate in Canada prior to your trip.Foreign diplomatic missions and consulates in Canada",
        "visaInfo": "If you’re a Canadian tourist wishing to stay for more than 30 days, you must apply at the General Directorate of Migration to obtain a tourist visa for another 30 days before the end of the first 30-day period. This extension can be obtained twice, at no extra cost and to a maximum of 90 days during one calendar year.If you have overstayed the 90-day period without proper authorization, you may be fined upon departure.General Directorate of Migration - Government of Bolivia",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Women's safety\", :description=>\"Women travelling alone may be subject to some forms of harassment and verbal abuse. Sexual assaults occur periodically, including at clubs and hostels. Female travellers should be cautious when dealing with strangers and new acquaintances. Lock your room when you return to your hotel/hostel.Safe-travel guide for women\"}",
        "healthInfo": "Quality of care varies greatly throughout the country. Good health care is limited to private hospitals in larger cities. Public medical services and facilities don’t meet Canadian standards. There’s limited access to health facilities in rural areas. There’s very limited ambulance service in Bolivia.Most clinics and hospitals in Bolivia accept payment in cash only. Clinics and hospitals may refuse to allow you to leave their premises before paying for services.Medical evacuation can be very expensive. You may need it in case of serious illness or injury.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "31",
        "hasAdvisoryWarning": false,
        "passportInfo": "Tourist visa: Not required (for stays of up to 90 days in a 180-day period)Business visa: Not requiredStudent visa: Required",
        "visaInfo": "Customs officials will ask you to show them a return ticket and proof of sufficient funds for your stay. They may also ask you to show proof of a valid reservation for accommodations.More about entry requirements - Embassy of the Netherlands to Canada",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": null,
        "healthInfo": "Medical care is generally good but may be limited in availability. San Francisco Hospital in Kralendijk, the capital city, is equipped to handle general surgery and emergency operations. There are a few medical clinics and one hyperbaric recompression chamber on the island. An air ambulance service is available.Medical facilities may require immediate cash payment for medical treatment.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "32",
        "hasAdvisoryWarning": false,
        "passportInfo": "Tourist visa: requiredBusiness visa: required Student visa: requiredTourist visas issued to Canadian passport holders are valid for multiple entries and usually for a 5-year period.When applying for a Brazilian entry visa, ensure the names on the Canadian passport and visa application are identical. Federal police will not accept applications with missing names or initials. This rule also applies to the names of the parents.You can obtain your visa online from Brazil eVisas.Stays are for a maximum of 90 days per visit.If you intent to stay more than 30 days, you must validate your visa at a local police station.If you intent to stay more than 90 days, you must obtain an extension from the Federal Police for a maximum stay of 180 days per year.To request a visa extension, you will have to :In order for your Canadian long form birth certificate to be accepted in Brazil, it must be presented to the Brazilian Embassy or one of its consulates prior to departure from Canada.  Neither the Embassy of Canada nor its consulates in Brazil can authenticate a Canadian birth certificate outside of Canada.",
        "visaInfo": "All Brazilian citizens must enter and leave Brazil with their Brazilian passport.Airlines may also require a valid Canadian passport for check-in and boarding procedures. You may face delays or be denied boarding by your airline if you attempt to return to Canada without a Canadian passport.",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": null,
        "healthInfo": "Good health care is only available in major cities. Quality of care varies greatly throughout the country.Private hospitals and clinics located in cities are often better staffed and equipped than public or rural facilities.Some medical facilities in the state of Rio de Janeiro have closed or are providing limited services, due to lack of funding for their operations. Private hospitals remain operational.Certain medications may not be available.Physicians and hospitals often expect immediate cash payment.Medical evacuation can be very expensive and you may need it in case of serious illness or injury.Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      },
      {
        "id": "33",
        "hasAdvisoryWarning": false,
        "passportInfo": "Tourist visa: not required for stays up to 8 monthsBusiness visa: not requiredStudent permit: required",
        "visaInfo": "Customs officials may ask you to show them a return or onward ticket.You must complete and sign an immigration card upon entry to The Bahamas. This card will be stamped by officials at the point of entry and you are required to keep the card until your departure.If travelling by private vessel, certain documentation is required for entry to The Bahamas.Department of Immigration - Government of The Bahamas",
        "vaccineInfo": "Be sure that your routine vaccines, as per your province or territory, are up-to-date regardless of your travel destination.Some of these vaccines include: measles-mumps-rubella (MMR), diphtheria, tetanus, pertussis, polio, varicella (chickenpox), influenza and others.",
        "transitInfo": "{:category=>\"Cruises\", :description=>\"Several ports in The Bahamas are cruise-ship stops.Advice for Cruise Travellers\"}",
        "healthInfo": "Medical care is good in Freeport and Nassau, but limited elsewhere.Medical expenses can be very high. It is normal for clinics to require patients to sign an undertaking-to-pay agreement and to take a credit card impression as guarantee of payment prior to providing medical care.Serious cases may be transferred to Freeport or Nassau, or to Miami, Florida, by air ambulance, especially those requiring surgery.Response times to emergency calls might be slow. Make sure you get travel insurance that includes coverage for medical evacuation and hospital stays.Travel health and safety"
      }
    ]
  }
}
```



### Response
```json
{
  "data": {
    "travelAdvisories": [
      {
        "id": "1",
        "name": "Andorra",
        "message": "Andorra has a current risk level of 1.3 (out of 5). We advise: Travelling Andorra is (relatively) safe.",
        "score": 1.3
      },
      {
        "id": "2",
        "name": "United Arab Emirates",
        "message": "United Arab Emirates has a current risk level of 2.3 (out of 5). We advise: Travelling United Arab Emirates is (relatively) safe.",
        "score": 2.3
      },
      {
        "id": "3",
        "name": "Afghanistan",
        "message": "Afghanistan has a current risk level of 5 (out of 5). We advise: It is not safe to travel Afghanistan.",
        "score": 5
      },
      {
        "id": "4",
        "name": "Antigua and Barbuda",
        "message": "Antigua and Barbuda has a current risk level of 1 (out of 5). We advise: Travelling Antigua and Barbuda is (relatively) safe.",
        "score": 1
      },
      {
        "id": "101",
        "name": "Iran",
        "message": "Iran has a current risk level of 3 (out of 5). We advise: Use some caution when travelling Iran.",
        "score": 3
      },
      {
        "id": "102",
        "name": "Iceland",
        "message": "Iceland has a current risk level of 1.5 (out of 5). We advise: Travelling Iceland is (relatively) safe.",
        "score": 1.5
      },
      {
        "id": "103",
        "name": "Italy",
        "message": "Italy has a current risk level of 1.8 (out of 5). We advise: Travelling Italy is (relatively) safe.",
        "score": 1.8
      },
      {
        "id": "104",
        "name": "Jersey",
        "message": "Jersey has a current risk level of 0 (out of 5). We advise: Travelling Jersey is (relatively) safe.",
        "score": 0
      },
      {
        "id": "105",
        "name": "Jamaica",
        "message": "Jamaica has a current risk level of 2.6 (out of 5). We advise: Use some caution when travelling Jamaica.",
        "score": 2.6
      },
      {
        "id": "106",
        "name": "Jordan",
        "message": "Jordan has a current risk level of 2.5 (out of 5). We advise: Use some caution when travelling Jordan.",
        "score": 2.5
      },
      {
        "id": "107",
        "name": "Japan",
        "message": "Japan has a current risk level of 1.8 (out of 5). We advise: Travelling Japan is (relatively) safe.",
        "score": 1.8
      },
      {
        "id": "108",
        "name": "Kenya",
        "message": "Kenya has a current risk level of 2.7 (out of 5). We advise: Use some caution when travelling Kenya.",
        "score": 2.7
      },
      {
        "id": "109",
        "name": "Kyrgyzstan",
        "message": "Kyrgyzstan has a current risk level of 2.4 (out of 5). We advise: Travelling Kyrgyzstan is (relatively) safe.",
        "score": 2.4
      },
      {
        "id": "110",
        "name": "Cambodia",
        "message": "Cambodia has a current risk level of 2 (out of 5). We advise: Travelling Cambodia is (relatively) safe.",
        "score": 2
      },
      {
        "id": "111",
        "name": "Kiribati",
        "message": "Kiribati has a current risk level of 1 (out of 5). We advise: Travelling Kiribati is (relatively) safe.",
        "score": 1
      },
      {
        "id": "112",
        "name": "Comoros",
        "message": "Comoros has a current risk level of 2.3 (out of 5). We advise: Travelling Comoros is (relatively) safe.",
        "score": 2.3
      },
      {
        "id": "113",
        "name": "Saint Kitts and Nevis",
        "message": "Saint Kitts and Nevis has a current risk level of 1 (out of 5). We advise: Travelling Saint Kitts and Nevis is (relatively) safe.",
        "score": 1
      },
      {
        "id": "114",
        "name": "North Korea",
        "message": "North Korea has a current risk level of 4.3 (out of 5). We advise: Please reconsider your need to travel to North Korea.",
        "score": 4.3
      },
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

### Users
Returns all users in the database

#### Request:

```graphql
{
  users {
    name
    email
  }
}
```

#### Response:

```json
{
  "data": {
    "users": [
      {
        "name": "Willene Von",
        "email": "willian.gottlieb@wisozk.name"
      },
      {
        "name": "Ms. Cathleen Schulist",
        "email": "travis.jones@schroeder.org"
      },
      {
        "name": "Teresita Beier I",
        "email": "shamika.champlin@collins.org"
      }
    ]
  }
}
```


### User and User's Trips
Returns a single User(determined by id) and the user's associated trips

#### Request:

```graphql
{
  user(id: 1) {
    name
    email
    trips {
      name
      startDate
      endDate
    }
  }
}
```

#### Response:

```json
{
  "data": {
    "user": {
      "name": "Penelope Conn",
      "email": "cordelia_mraz@smithambeier.net",
      "trips": [
        {
          "name": "Honduras",
          "startDate": "2018-10-23",
          "endDate": "2020-04-21"
        },
        {
          "name": "Indonesia",
          "startDate": "2019-03-24",
          "endDate": "2020-01-20"
        },
        {
          "name": "Mayotte",
          "startDate": "2019-01-01",
          "endDate": "2019-10-24"
        },
        {
          "name": "Sierra Leone",
          "startDate": "2019-08-10",
          "endDate": "2020-05-15"
        },
        {
          "name": "Colombia",
          "startDate": "2019-07-04",
          "endDate": "2020-07-11"
        },
        {
          "name": "Malaysia",
          "startDate": "2019-03-22",
          "endDate": "2019-12-24"
        }
      ]
    }
  }
}
```

### Trip and Trip's Legs
Returns a single trip(by id passed in), and the associated legs

#### Request

```graphql
{
  trip(id: 1) {
    name
    startDate
    endDate
  }
  legs {
    name
    startDate
    endDate
  }
}
```

#### Response

```json
{
  "data": {
    "trip": {
      "name": "Lesotho",
      "startDate": "2019-05-29",
      "endDate": "2019-12-11"
    },
    "legs": [
      {
        "name": "Malta",
        "startDate": "2019-06-27",
        "endDate": "2020-09-09"
      },
      {
        "name": "Guyana",
        "startDate": "2019-10-19",
        "endDate": "2020-08-11"
      },
      {
        "name": "Grenada",
        "startDate": "2019-01-12",
        "endDate": "2020-04-23"
      },
      {
        "name": "French Guiana",
        "startDate": "2019-09-28",
        "endDate": "2019-12-10"
      },
      {
        "name": "Burundi",
        "startDate": "2019-04-13",
        "endDate": "2019-12-31"
      },
      {
        "name": "Czech Republic",
        "startDate": "2019-01-01",
        "endDate": "2020-03-10"
      },
      {
        "name": "Comoros",
        "startDate": "2018-12-16",
        "endDate": "2020-02-27"
      },
      {
        "name": "Nigeria",
        "startDate": "2019-07-15",
        "endDate": "2020-06-29"
      },
      {
        "name": "Saint Kitts and Nevis",
        "startDate": "2019-07-16",
        "endDate": "2020-02-22"
      }
    ]
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
      name

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
          "name": "North Sharieton"
        },
        {
          "name": "Hannahmouth"
        },
        {
          "name": "West Carlo"
        }
      ]
    }
  }
}
```

### User and User's Notifications
Returns all the notifications for a single user by passing in the user's ID

#### Request

```graphql
{
  user(id: 1) {
    id
    name
    email
  }
  notifications {
    id
    active
    userId
  }
}
```

#### Response

```json
{
  "data": {
    "user": {
      "id": "1",
      "name": "Michal Bauch",
      "email": "lecia@schamberger.biz"
    },
    "notifications": [
      {
        "id": "1",
        "active": true,
        "userId": 1
      },
      {
        "id": "2",
        "active": true,
        "userId": 1
      },
      {
        "id": "3",
        "active": true,
        "userId": 1
      }
    ]
  }
}
```

### Leg and Leg Transportations
Returns single leg based on the ID passed in, and associated transportations

#### Request

```graphql
{
  leg(id: 1) {
    id
    name
    startDate
    endDate
    tripId
  }
  transportations {
    id
    mode
    departureTime
    departureCity
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
      "id": "1",
      "name": "Tuvalu",
      "startDate": "2019-07-15",
      "endDate": "2019-11-18",
      "tripId": 1
    },
    "transportations": [
      {
        "id": "1",
        "mode": "flight",
        "departureTime": "2020-09-19 03:56:51 -0600",
        "departureCity": "Sonfurt",
        "arrivalTime": "2019-07-20 06:53:13 -0600",
        "arrivalCity": "South Yvone"
      },
      {
        "id": "2",
        "mode": "flight",
        "departureTime": "2020-01-13 16:01:26 -0700",
        "departureCity": "Conradville",
        "arrivalTime": "2019-04-02 04:08:33 -0600",
        "arrivalCity": "Lake Felix"
      },
      {
        "id": "3",
        "mode": "flight",
        "departureTime": "2019-12-14 23:59:54 -0700",
        "departureCity": "New Buster",
        "arrivalTime": "2019-01-17 04:08:12 -0700",
        "arrivalCity": "Port Billfurt"
      }
    ]
  }
}
```

### Destination and Destination Lodgings
Returns single destination based on the ID passed in, and the associated lodgings

#### Request

```graphql
{
  leg(id: 1) {
    destinations {
      name
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
          "name": "North Sharieton"
        },
        {
          "name": "Hannahmouth"
        },
        {
          "name": "West Carlo"
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
  createTrip(input: {name: "Austraila", userId: 1, startDate: "Nov 11th", endDate: "Dec 1st"}) {
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
        "name": "Austraila",
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
  updateTrip(input: {id: 1, name: "Mexico City" startDate: "Nov 11th", endDate: "Dec 1st"}) {
    trip {
      name
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
        "name": "Mexico City"
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
  removeTrip(input: {id: 3}) {
    trip {
      name
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
        "name": "Bosnia and Herzegovina"
      }
    }
  }
}
```


### Create Leg

Required Fields
- name
- startDate
- endDate
- startLocation
- endLocation
- tripId

#### Request
```graphql
mutation {
  createLeg(input: {name: "Spain", startDate: "10/30/19", endDate: "11/12/19", startLocation: "New York", endLocation:"Oslo", tripId: 1}) {
    leg {
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
    "createLeg": {
      "leg": {
        "name": "Spain",
        "startDate": "10/30/19",
        "endDate": "11/12/19"
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
  updateLeg(input: {id: 1, name: "Mexico City", startDate: "Nov 11th", endDate: "Dec 1st", tripId:2}) {
    leg {
      name
      startDate
      endDate
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
        "name": "Mexico City",
        "startDate": "Nov 11th",
        "endDate": "Dec 1st",
        "tripId": 2
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
  removeLeg(input: {id: 1}) {
    leg {
      name
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
        "name": "Rwanda"
      }
    }
  }
}
```

### Create Destination

#### Request

```graphql
mutation {
  createDestination(input: {name: "Oslo", legId: 1}) {
    destination {
      name
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
        "name": "Oslo"
      }
    }
  }
}
```


###  Update Destination
#### Request
```graphql
mutation {
  updateDestination(input: {id:1, name: "Oslo", legId: 1}) {
    destination {
      name
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
        "name": "Oslo"
      }
    }
  }
}
```

### Remove Destination

#### Request
```graphql
mutation {
  removeDestination(input: {id: 6}) {
    destination {
      name
    }
  }
}
```
#### Response
```json
{
  "data": {
    "destination": {
      "name": "Colliermouth"
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
- destinationId

#### Request
```graphql
mutation {
  createLodging(
    input: {
      name: "Queen Anne Hotel",
      arrivalDate: "2019-10-20",
      departureDate: "2019-10-11",
      city: "San Francisco",
      destinationId: 2
    })
  {
    lodging {
    	name
      arrivalDate
      departureDate
      city
      destinationId
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
        "name": "Queen Anne Hotel",
        "arrivalDate": "2019-10-20",
        "departureDate": "2019-10-11",
        "city": "San Francisco",
        "destinationId": 2
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
- destinationId

#### Request
```graphql
mutation {
  updateLodging(
    input: {
      id: 3,
    	name: "Marriott",
      arrivalDate: "2018-11-17",
      departureDate: "2020-08-15",
      city: "Alfredmouth",
      destinationId: 1
    })
  {
    lodging {
      name
    	arrivalDate
    	departureDate
    	city
      destinationId
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
        "name": "Marriott",
        "arrivalDate": "2018-11-17",
        "departureDate": "2020-08-15",
        "city": "Alfredmouth",
        "destinationId": 1
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
  removeLodging(input: {id: 8}) {
    lodging {
      name
      arrivalDate
      departureDate
      city
      destinationId
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
        "name": "Bruen, Purdy and Witting",
        "arrivalDate": "2019-01-23",
        "departureDate": "2020-02-06",
        "city": "Chancemouth",
        "destinationId": 1
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
      arrivalTime: "2019-04-02 04:08:33 -0600",
      departureTime: "2020-01-13 16:01:26 -0700",
      arrivalCity: "San Juan",
      departureCity: "Hollywood",
      legId: 1
    })
  {
    transportation {
    	mode
    	departureTime
    	departureCity
    	arrivalTime
    	arrivalCity
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
        "mode": "bus",
        "departureTime": "2020-01-13 16:01:26 -0700",
        "departureCity": "Hollywood",
        "arrivalTime": "2019-04-02 04:08:33 -0600",
        "arrivalCity": "San Juan",
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
      id: 3,
      mode: "bus",
      arrivalTime: "2019-04-02 04:08:33 -0600",
      departureTime: "2020-01-13 16:01:26 -0700",
      arrivalCity: "Mars",
      departureCity: "Earth",
      legId: 1
    })
  {
    transportation {
      id
    	mode
    	departureTime
    	departureCity
    	arrivalTime
    	arrivalCity
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
        "id": "3",
        "mode": "bus",
        "departureTime": "2020-01-13 16:01:26 -0700",
        "departureCity": "Earth",
        "arrivalTime": "2019-04-02 04:08:33 -0600",
        "arrivalCity": "Mars",
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
      id: 3,
    })
  {
    transportation {
      id
    	mode
    	departureTime
    	departureCity
    	arrivalTime
    	arrivalCity
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
        "id": "3",
        "mode": "bus",
        "departureTime": "2020-01-13 16:01:26 -0700",
        "departureCity": "Earth",
        "arrivalTime": "2019-04-02 04:08:33 -0600",
        "arrivalCity": "Mars",
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
  createNotification(
    input: {
      active: true,
      userId: 4
    })
  {
    notification {
      id
      active
      userId
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
        "id": "8",
        "active": true,
        "userId": 4
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
  updateNotification(
    input: {
      id: 8
      active: false,
      userId: 4
    })
  {
    notification {
      id
      active
      userId
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
        "id": "8",
        "active": false,
        "userId": 4
      }
    }
  }
}
```

### Remove Notification

Deletes a notification from the DB.

Required Fields
- id

#### Request
```graphql
mutation {
  removeNotification(
    input: {
      id: 8
    })
  {
    notification {
      id
      active
      userId
    }
  }
}
```

#### Response

```json
{
  "data": {
    "removeNotification": {
      "notification": {
        "id": "8",
        "active": false,
        "userId": 4
      }
    }
  }
}
```
