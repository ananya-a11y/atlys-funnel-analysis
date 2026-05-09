CREATE TABLE funnel_dropoffs (
    "UserId" TEXT,
    "ApplicationId" text,
    "Phone" TEXT,
    "Email" TEXT,
    "Device" TEXT,
    "User Device" TEXT,
    "Destination" TEXT,
    "City" TEXT,
    "DropOff Step" TEXT,
    "Time Spent (in mins)" NUMERIC
);

CREATE TABLE mom_clp_txn (
    date DATE,
    "CLP Visitors" NUMERIC,
    "Converting Users" NUMERIC,
    "Conv_pct" numeric
);

CREATE TABLE mom_clp_apply (
  date DATE,
  "CLP Visitors" INT,
  "Apply Now" INT,
  conv_pct numeric
);


CREATE TABLE mom_travel_dates (
  date DATE,
  "Travel Dates Entered" INT,
  "Selfie Uploaded" INT,
  conv_pct numeric
);

CREATE TABLE mom_selfie_passport (
  date DATE,
  "Selfie Uploaded" INT,
  "Passport Front Uploaded" INT,
  conv_pct numeric
);

CREATE TABLE mom_passport_review (
  date DATE,
  "Passport Front Uploaded" INT,
  "Review Done" INT,
  conv_pct numeric
);

CREATE TABLE mom_review_checkout (
  date DATE,
  "Review Done" INT,
  "Checkout Click" INT,
  conv_pct numeric
);

CREATE TABLE mom_checkout_txn (
  date DATE,
  "Checkout Clicks" INT,
  Txn INT,
  conv_pct numeric
);

