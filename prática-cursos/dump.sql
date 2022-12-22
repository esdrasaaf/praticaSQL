CREATE TABLE "public.students" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"cpf" varchar(11) NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE,
	"actualClassId" integer NOT NULL,
	CONSTRAINT "students_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.class" (
	"id" serial NOT NULL,
	"code" varchar(10) NOT NULL UNIQUE,
	CONSTRAINT "class_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.historic" (
	"id" serial NOT NULL,
	"studentId" integer NOT NULL,
	"classId" integer NOT NULL,
	"entryDate" DATE NOT NULL,
	"exitDate" DATE NOT NULL,
	CONSTRAINT "historic_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.projects" (
	"id" serial NOT NULL,
	"studentId" integer NOT NULL,
	"date" DATE NOT NULL,
	"hour" DATE NOT NULL,
	"note" TEXT NOT NULL,
	"name" varchar(30) NOT NULL,
	"moduleId" integer NOT NULL,
	CONSTRAINT "projects_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.modules" (
	"id" serial NOT NULL,
	"name" varchar(20) NOT NULL UNIQUE,
	CONSTRAINT "modules_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


ALTER TABLE "students" ADD CONSTRAINT "students_fk0" FOREIGN KEY ("actualClassId") REFERENCES "class"("id");
ALTER TABLE "historic" ADD CONSTRAINT "historic_fk0" FOREIGN KEY ("studentId") REFERENCES "students"("id");
ALTER TABLE "historic" ADD CONSTRAINT "historic_fk1" FOREIGN KEY ("classId") REFERENCES "class"("id");
ALTER TABLE "projects" ADD CONSTRAINT "projects_fk0" FOREIGN KEY ("studentId") REFERENCES "students"("id");
ALTER TABLE "projects" ADD CONSTRAINT "projects_fk1" FOREIGN KEY ("moduleId") REFERENCES "modules"("id");