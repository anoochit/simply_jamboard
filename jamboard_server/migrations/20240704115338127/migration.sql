BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "user_stream" DROP COLUMN "connected";
CREATE UNIQUE INDEX "user_stream_unique_idx" ON "user_stream" USING btree ("boardId", "userId");

--
-- MIGRATION VERSION FOR jamboard
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('jamboard', '20240704115338127', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240704115338127', "timestamp" = now();

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
