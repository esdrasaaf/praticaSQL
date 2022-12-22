CREATE TABLE "public.companies" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL UNIQUE,
	"acronym" varchar(10) NOT NULL,
	CONSTRAINT "companies_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.flights" (
	"id" serial NOT NULL,
	"acronym" varchar(10) NOT NULL UNIQUE,
	"companyId" integer NOT NULL,
	"travelId" integer NOT NULL,
	"hoursId" integer NOT NULL,
	CONSTRAINT "flights_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.airport" (
	"id" serial NOT NULL,
	"acronym" varchar(10) NOT NULL,
	"name" varchar(100) NOT NULL UNIQUE,
	CONSTRAINT "airport_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.travel" (
	"id" serial NOT NULL,
	"departureId" integer NOT NULL,
	"destinyId" integer NOT NULL,
	CONSTRAINT "travel_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.hours" (
	"id" serial NOT NULL,
	"exit" DATE NOT NULL,
	"arrival" DATE NOT NULL,
	CONSTRAINT "hours_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "flights" ADD CONSTRAINT "flights_fk0" FOREIGN KEY ("companyId") REFERENCES "companies"("id");
ALTER TABLE "flights" ADD CONSTRAINT "flights_fk1" FOREIGN KEY ("travelId") REFERENCES "travel"("id");
ALTER TABLE "flights" ADD CONSTRAINT "flights_fk2" FOREIGN KEY ("hoursId") REFERENCES "hours"("id");
ALTER TABLE "travel" ADD CONSTRAINT "travel_fk0" FOREIGN KEY ("departureId") REFERENCES "airport"("id");
ALTER TABLE "travel" ADD CONSTRAINT "travel_fk1" FOREIGN KEY ("destinyId") REFERENCES "airport"("id");