BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "board" ADD COLUMN "cover" bytea;

--
-- MIGRATION VERSION FOR jamboard
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('jamboard', '20240702091507303', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240702091507303', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_chat
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_chat', '20240115074243685', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074243685', "timestamp" = now();


COMMIT;
